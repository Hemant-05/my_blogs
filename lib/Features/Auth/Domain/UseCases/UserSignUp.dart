import 'package:fpdart/src/either.dart';
import 'package:my_blogs/Core/Common/Entities/User.dart';
import 'package:my_blogs/Core/Error/Failure.dart';
import 'package:my_blogs/Core/UseCases/UseCase.dart';
import 'package:my_blogs/Features/Auth/Domain/Repository/AuthRepository.dart';

class UserSignUp implements UseCase<User, userSignUpParams> {
  final AuthManagerRepo repo;

  const UserSignUp(this.repo);

  @override
  Future<Either<Failure, User>> call(params) async {
    return await repo.signupWithEmailPass(
      name: params.name,
      email: params.email,
      pass: params.pass,
    );
  }
}

class userSignUpParams {
  final String name;
  final String email;
  final String pass;

  userSignUpParams({
    required this.name,
    required this.email,
    required this.pass,
  });
}
