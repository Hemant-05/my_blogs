import 'package:get_it/get_it.dart';
import 'package:my_blogs/Core/Common/Cubit/AppUser/app_user_cubit.dart';
import 'package:my_blogs/Features/Auth/Data/DataSource/AuthRemoteDataSource.dart';
import 'package:my_blogs/Features/Auth/Data/Repository/AuthRepoImpl.dart';
import 'package:my_blogs/Features/Auth/Domain/Repository/AuthRepository.dart';
import 'package:my_blogs/Features/Auth/Domain/UseCases/CurrentUser.dart';
import 'package:my_blogs/Features/Auth/Domain/UseCases/UserLogIn.dart';
import 'package:my_blogs/Features/Auth/Domain/UseCases/UserSignUp.dart';
import 'package:my_blogs/Features/Auth/Presentation/Bloc/auth_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'Core/Secrets/Supabase_secrets.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();
  final supabase = await Supabase.initialize(
    url: Supabase_secrets.url,
    anonKey: Supabase_secrets.anonKey,
  );
  serviceLocator.registerLazySingleton(() => supabase.client);
  //core
  serviceLocator.registerLazySingleton(() => AppUserCubit());
}

void _initAuth() {
  serviceLocator.registerFactory<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      serviceLocator(),
    ),
  );
  serviceLocator.registerFactory<AuthManagerRepo>(
    () => AuthRepoImpl(
      serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => UserSignUp(
      serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => UserLogIn(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => CurrentUser(
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => AuthBloc(
      userSignUp: serviceLocator(),
      userLogIn: serviceLocator(),
      currentUser: serviceLocator(),
      appUserCubit: serviceLocator(),
    ),
  );
}
