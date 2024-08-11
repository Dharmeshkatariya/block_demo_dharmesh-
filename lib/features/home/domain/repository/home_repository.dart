
import 'package:block_demo_dharmesh/models/update_user.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failures.dart';
import '../../../../models/slider_images.dart';

abstract class HomeRepository {
  Future<Either<Failure, UserDetailsResModel>> getUserDetail();
  Future<Either<Failure, List<SliderImageData>>> getSliderImages();

}