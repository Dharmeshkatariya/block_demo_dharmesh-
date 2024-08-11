
import 'package:block_demo_dharmesh/models/slider_images.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures.dart';
import '../repository/home_repository.dart';

class GetSliderImagesListCase {
  final HomeRepository homeRepo;
  GetSliderImagesListCase({required this.homeRepo});

  Future<Either<Failure, List<SliderImageData>>> getSliderImages() async {
    try {
      return await homeRepo.getSliderImages();
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}