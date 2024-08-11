
import 'package:block_demo_dharmesh/core/errors/failures.dart';
import 'package:block_demo_dharmesh/features/standard/domain/repository/standard_repository.dart';
import 'package:block_demo_dharmesh/models/home_res_model.dart';
import 'package:fpdart/src/either.dart';

import '../data_resource/standard_network_db.dart';

class StandardRepositoryImplImpl implements StandardRepository {
  final StandardNetworkDb standardNetworkDb;

  StandardRepositoryImplImpl({required this.standardNetworkDb});

  @override
  Future<Either<Failure, List<StandardRes>>> getStandardApi({int? mediumId}) async {
  return await standardNetworkDb.getStandardApi(mediumId: mediumId ) ;
  }

  @override
  Future<Either<Failure, List<StandardRes>>> getStandardVideoApi({int? mediumId}) async {
    return await standardNetworkDb.getStandardVideoApi(mediumId: mediumId) ;

  }


}