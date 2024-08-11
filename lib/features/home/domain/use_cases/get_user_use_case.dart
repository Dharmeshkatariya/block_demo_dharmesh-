import 'package:block_demo_dharmesh/features/home/domain/repository/home_repository.dart';
import 'package:block_demo_dharmesh/models/update_user.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failures.dart';

class GetUserDetailUseCase {
  final HomeRepository homeRepo;
  GetUserDetailUseCase({required this.homeRepo});

  Future<Either<Failure, UserDetailsResModel>> getCurrentUserDetail() async {
    try {
      return await homeRepo.getUserDetail();
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}