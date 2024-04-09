import 'package:fpdart/fpdart.dart';
import 'package:my_blogs/Core/Common/Entities/User.dart';

import '../../../../Core/Error/Failure.dart';

abstract interface class AuthManagerRepo {
  Future<Either<Failure, User>> getCurrentUser();

  Future<Either<Failure, User>> signupWithEmailPass({
    required String name,
    required String email,
    required String pass,
  });

  Future<Either<Failure, User>> loginWithEmailPass({
    required String email,
    required String pass,
  });
}
