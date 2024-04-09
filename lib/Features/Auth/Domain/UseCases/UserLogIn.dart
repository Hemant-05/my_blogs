import 'package:fpdart/fpdart.dart';
import 'package:my_blogs/Core/Common/Entities/User.dart';
import 'package:my_blogs/Core/Error/Failure.dart';
import 'package:my_blogs/Core/UseCases/UseCase.dart';
import 'package:my_blogs/Features/Auth/Domain/Repository/AuthRepository.dart';

class UserLogIn implements UseCase<User, UserLoginParams> {
  final AuthManagerRepo authRepo;

  const UserLogIn(this.authRepo);

  @override
  Future<Either<Failure, User>> call(UserLoginParams params) async {
    return await authRepo.loginWithEmailPass(
      email: params.email,
      pass: params.pass,
    );
  }
}

class UserLoginParams {
  final String email;
  final String pass;

  UserLoginParams({
    required this.email,
    required this.pass,
  });
}
