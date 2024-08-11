
import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures.dart';
import '../../../../models/medium_data.dart';
import '../repositories/medium_repository.dart';

class GetMediumBookVideoApiUseCase {
  final MediumRepository mediumRepository;
  GetMediumBookVideoApiUseCase({required this.mediumRepository});

  Future<Either<Failure, List<MediumData>>> getMediumVideoApi() async {
    try {
      return await mediumRepository.getMediumVideoApi();
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}