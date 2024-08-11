
import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures.dart';
import '../../../../models/slider_images.dart';
import '../../../../models/update_user.dart';

abstract class HomeNetworkDb {
  Future<Either<Failure, UserDetailsResModel>> getUserDetail();
  Future<Either<Failure, List<SliderImageData>>> getSliderImages();
}