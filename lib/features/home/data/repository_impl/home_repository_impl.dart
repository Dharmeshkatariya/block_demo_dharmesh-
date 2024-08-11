import 'package:block_demo_dharmesh/features/home/data/data_resource/home_network_db.dart';
import 'package:block_demo_dharmesh/models/slider_images.dart';
import 'package:block_demo_dharmesh/models/update_user.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../export.dart';
import '../../domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeNetworkDb homeNetworkDb;

  HomeRepositoryImpl({required this.homeNetworkDb});

  @override
  Future<Either<Failure, UserDetailsResModel>> getUserDetail() async {
    return await homeNetworkDb.getUserDetail();
  }

  @override
  Future<Either<Failure, List<SliderImageData>>> getSliderImages() async {
    return await homeNetworkDb.getSliderImages();
  }
}
