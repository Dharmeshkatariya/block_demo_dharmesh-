
import 'package:block_demo_dharmesh/models/medium_data.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures.dart';

abstract class MediumNetworkDb{
  Future<Either<Failure, List<MediumData>>> getMediumApi();
  Future<Either<Failure, List<MediumData>>> getMediumVideoApi();
}