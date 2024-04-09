import 'package:fpdart/src/either.dart';
import 'package:my_blogs/Core/Common/Entities/User.dart';
import 'package:my_blogs/Core/Error/Exception.dart';
import 'package:my_blogs/Core/Error/Failure.dart';
import 'package:my_blogs/Features/Auth/Data/DataSource/AuthRemoteDataSource.dart';
import 'package:my_blogs/Features/Auth/Domain/Repository/AuthRepository.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;

class AuthRepoImpl implements AuthManagerRepo {
  final AuthRemoteDataSource dataSource;

  AuthRepoImpl(this.dataSource);

  @override
  Future<Either<Failure, User>> loginWithEmailPass({
    required String email,
    required String pass,
  }) async {
    return _getUser(
      () async => await dataSource.loginWithEmailPass(
        email: email,
        pass: pass,
      ),
    );
  }

  @override
  Future<Either<Failure, User>> signupWithEmailPass({
    required String name,
    required String email,
    required String pass,
  }) async {
    return _getUser(
      () async => await dataSource.singupWithEmailPass(
        name: name,
        email: email,
        pass: pass,
      ),
    );
  }

  Future<Either<Failure, User>> _getUser(
    Future<User> Function() fn,
  ) async {
    try {
      final user = await fn();
      return right(user);
    } on sb.AuthException catch (e) {
      return left(Failure(e.message));
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, User>> getCurrentUser() async {
    try {
      final user = await dataSource.getCurrentUserDetails();
      if (user == null) {
        return left(Failure('User not logged in!'));
      }
      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
