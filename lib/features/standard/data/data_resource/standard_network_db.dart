import 'package:block_demo_dharmesh/models/home_res_model.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures.dart';

abstract class StandardNetworkDb{
  Future<Either<Failure, List<StandardRes>>> getStandardApi({int? mediumId});
  Future<Either<Failure, List<StandardRes>>> getStandardVideoApi({int? mediumId});
}