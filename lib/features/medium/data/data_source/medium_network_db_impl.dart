import 'package:block_demo_dharmesh/core/errors/failures.dart';
import 'package:block_demo_dharmesh/features/medium/data/data_source/medium_network_db.dart';
import 'package:block_demo_dharmesh/models/medium_data.dart';
import 'package:fpdart/src/either.dart';

import '../../../../core/api_providers/api_service.dart';

class MediumNetworkDbImpl implements MediumNetworkDb{
  @override
  Future<Either<Failure, List<MediumData>>> getMediumApi() async {
    final userDetails = await API.getHomeMediumApi();
    return userDetails.fold(
          (failure) => Left(Failure(message: failure)),
          (userDetailsResModel) => Right(userDetailsResModel),
    );
  }

  @override
  Future<Either<Failure, List<MediumData>>> getMediumVideoApi() async {
    final userDetails = await API.getMediumVideoApi();
    return userDetails.fold(
          (failure) => Left(Failure(message: failure)),
          (userDetailsResModel) => Right(userDetailsResModel),
    );
  }

}