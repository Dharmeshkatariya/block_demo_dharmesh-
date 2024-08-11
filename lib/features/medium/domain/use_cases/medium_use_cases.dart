
import 'package:block_demo_dharmesh/features/medium/domain/repositories/medium_repository.dart';
import 'package:block_demo_dharmesh/models/medium_data.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures.dart';

class GetMediumBookUseCase {
  final MediumRepository mediumRepository;
  GetMediumBookUseCase({required this.mediumRepository});

  Future<Either<Failure, List<MediumData>>> getMediumApi() async {
    try {
      return await mediumRepository.getMediumApi();
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}