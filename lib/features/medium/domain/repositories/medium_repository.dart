import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures.dart';
import '../../../../models/medium_data.dart';

abstract class MediumRepository {
  Future<Either<Failure, List<MediumData>>> getMediumApi() ;
  Future<Either<Failure, List<MediumData>>> getMediumVideoApi() ;
}