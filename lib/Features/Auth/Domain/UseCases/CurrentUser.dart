import 'package:fpdart/fpdart.dart';
import 'package:my_blogs/Core/Common/Entities/User.dart';
import 'package:my_blogs/Core/Error/Failure.dart';
import 'package:my_blogs/Core/UseCases/UseCase.dart';
import 'package:my_blogs/Features/Auth/Domain/Repository/AuthRepository.dart';

class CurrentUser implements UseCase<User, NoParams> {
  final AuthManagerRepo authRepo;

  CurrentUser(this.authRepo);

  @override
  Future<Either<Failure, User>> call(params) {
    return authRepo.getCurrentUser();
  }
}
