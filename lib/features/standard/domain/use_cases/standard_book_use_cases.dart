
import 'package:block_demo_dharmesh/features/medium/domain/repositories/medium_repository.dart';
import 'package:block_demo_dharmesh/features/standard/domain/repository/standard_repository.dart';
import 'package:block_demo_dharmesh/models/home_res_model.dart';
import 'package:block_demo_dharmesh/models/medium_data.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures.dart';

class GetStandardBookUseCase {
  final StandardRepository standardRepository;
  GetStandardBookUseCase({required this.standardRepository});

  Future<Either<Failure, List<StandardRes>>> getStandardApi({int? mediumId}) async {
    try {
      return await standardRepository.getStandardApi(mediumId:mediumId );
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

}