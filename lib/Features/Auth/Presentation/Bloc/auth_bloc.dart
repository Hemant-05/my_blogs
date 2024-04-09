import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_blogs/Core/Common/Cubit/AppUser/app_user_cubit.dart';
import 'package:my_blogs/Core/Common/Entities/User.dart';
import 'package:my_blogs/Core/UseCases/UseCase.dart';
import 'package:my_blogs/Features/Auth/Domain/UseCases/CurrentUser.dart';
import '../../Domain/UseCases/UserLogIn.dart';
import '../../Domain/UseCases/UserSignUp.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  final UserLogIn _userLogIn;
  final CurrentUser _currentUser;
  final AppUserCubit _appUserCubit;

  AuthBloc({
    required CurrentUser currentUser,
    required UserLogIn userLogIn,
    required UserSignUp userSignUp,
    required AppUserCubit appUserCubit,
  })  : _userSignUp = userSignUp,
        _userLogIn = userLogIn,
        _currentUser = currentUser,
        _appUserCubit = appUserCubit,
        super(AuthInitial()) {
    on<AuthEvent>((event, emit) => emit(AuthLoading()));
    on<AuthSignUp>(_onAuthSignUp);
    on<AuthLogin>(_onAuthLogin);
    on<AuthIsUserLoggedIn>(_isUserLoggedIn);
  }

  void _isUserLoggedIn(
    AuthIsUserLoggedIn event,
    Emitter<AuthState> emit,
  ) async {
    final res = await _currentUser(NoParams());
    res.fold(
      (l) => emit(
        AuthFailure(l.error),
      ),
      (user) {
        _emitAuthSuccess(user, emit);
      },
    );
  }

  void _onAuthLogin(
    AuthLogin event,
    Emitter<AuthState> emit,
  ) async {
    final res = await _userLogIn(
      UserLoginParams(email: event.email, pass: event.pass),
    );
    res.fold((failure) => emit(AuthFailure(failure.error)),
        (user) => _emitAuthSuccess(user, emit));
  }

  void _onAuthSignUp(
    AuthSignUp event,
    Emitter<AuthState> emit,
  ) async {
    final res = await _userSignUp(
      userSignUpParams(
        name: event.name,
        email: event.email,
        pass: event.pass,
      ),
    );
    res.fold((failure) => emit(AuthFailure(failure.error)), (user) {
      _emitAuthSuccess(user, emit);
    });
  }

  void _emitAuthSuccess(
    User user,
    Emitter<AuthState> emit,
  ) {
    _appUserCubit.updateUser(user);
    emit(AuthSuccess(user));
  }
}
