import 'package:block_demo_dharmesh/core/errors/failures.dart';
import 'package:block_demo_dharmesh/features/standard/data/data_resource/standard_network_db.dart';
import 'package:block_demo_dharmesh/models/home_res_model.dart';
import 'package:block_demo_dharmesh/models/medium_data.dart';
import 'package:fpdart/src/either.dart';

import '../../../../core/api_providers/api_service.dart';

class StandardNetworkDbImpl implements StandardNetworkDb {
  @override
  Future<Either<Failure, List<StandardRes>>> getStandardApi({int? mediumId}) async {
    final standard = await API.getStandardApi(mediumId: mediumId);
    return standard.fold(
      (failure) => Left(Failure(message: failure)),
      (userDetailsResModel) => Right(userDetailsResModel),
    );
  }

  @override
  Future<Either<Failure, List<StandardRes>>> getStandardVideoApi({int? mediumId}) async {
    final standard = await API.getStandardVideoApi(mediumId: mediumId);
    return standard.fold(
      (failure) => Left(Failure(message: failure)),
      (userDetailsResModel) => Right(userDetailsResModel),
    );
  }
}
