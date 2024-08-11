import 'package:block_demo_dharmesh/export.dart';
import 'package:block_demo_dharmesh/models/slider_images.dart';
import 'package:block_demo_dharmesh/models/update_user.dart';
import 'package:fpdart/src/either.dart';
import 'home_network_db.dart';

class HomeNetworkDbImpl implements HomeNetworkDb {
  @override
  Future<Either<Failure, UserDetailsResModel>> getUserDetail() async {
    final userDetails = await API.getUserProfile();
    return userDetails.fold(
      (failure) => Left(Failure(message: failure)),
      (userDetailsResModel) => Right(userDetailsResModel),
    );
  }

  @override
  Future<Either<Failure, List<SliderImageData>>> getSliderImages() async {
    final sliderImage = await API.getHomeSliderApi();
    return sliderImage.fold(
      (failure) => Left(Failure(message: failure)),
      (sliderImage) => Right(sliderImage),
    );
  }
}
