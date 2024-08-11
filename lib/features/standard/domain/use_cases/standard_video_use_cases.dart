
import 'package:block_demo_dharmesh/features/standard/domain/repository/standard_repository.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures.dart';
import '../../../../models/home_res_model.dart';
import '../../../../models/medium_data.dart';

class GetStandardBookVideoApiUseCase {
  final StandardRepository standardRepository;
  GetStandardBookVideoApiUseCase({required this.standardRepository});

  Future<Either<Failure, List<StandardRes>>> getStandardVideoApi({int? mediumId}) async {
    try {
      return await standardRepository.getStandardVideoApi(mediumId:mediumId );
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}