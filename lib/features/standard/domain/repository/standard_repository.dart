import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failures.dart';
import '../../../../models/home_res_model.dart';

abstract class StandardRepository {
  Future<Either<Failure, List<StandardRes>>> getStandardApi({int? mediumId});
  Future<Either<Failure, List<StandardRes>>> getStandardVideoApi({int? mediumId});
}