
import 'package:block_demo_dharmesh/core/errors/failures.dart';
import 'package:block_demo_dharmesh/features/medium/data/data_source/medium_network_db.dart';
import 'package:block_demo_dharmesh/features/medium/domain/repositories/medium_repository.dart';
import 'package:block_demo_dharmesh/models/medium_data.dart';
import 'package:fpdart/src/either.dart';

class MediumRepositoryImplImpl implements MediumRepository {
  final MediumNetworkDb mediumNetworkDb;

  MediumRepositoryImplImpl({required this.mediumNetworkDb});

  @override
  Future<Either<Failure, List<MediumData>>> getMediumApi() async {
    return await  mediumNetworkDb.getMediumApi() ;
  }

  @override
  Future<Either<Failure, List<MediumData>>> getMediumVideoApi() async {
    return await  mediumNetworkDb.getMediumVideoApi() ;
  }

}