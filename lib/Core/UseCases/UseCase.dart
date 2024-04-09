import 'package:fpdart/fpdart.dart';
import 'package:my_blogs/Core/Error/Failure.dart';

abstract interface class UseCase<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params params);
}

class NoParams {}
