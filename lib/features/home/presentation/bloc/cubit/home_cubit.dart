import 'package:bloc/bloc.dart';
import 'package:block_demo_dharmesh/features/home/domain/use_cases/get_slider_images_list.dart';
import 'package:block_demo_dharmesh/features/home/domain/use_cases/get_user_use_case.dart';
import 'package:block_demo_dharmesh/models/slider_images.dart';
import 'package:block_demo_dharmesh/models/update_user.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/widget/common.dart';
import '../../../../../export.dart';
import '../../../../../injection_container.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  Future<void> getUser() async {
    var user =
        await locator.call<GetUserDetailUseCase>().getCurrentUserDetail();
    user.fold(
      (failure) => emit(HomeFailure(error: failure.message)),
      (result) => emit(HomeUserSuccess(userDetailsResModel: result)),
    );
  }

  Future<void> getApiSliderImages() async {
    emit(HomeLoading());
    var sliderImage =
    await locator.call<GetSliderImagesListCase>().getSliderImages();
    sliderImage.fold(
          (failure) => emit(HomeFailure(error: failure.message)),
          (list) {
        _updateImageSliders(list);
        // emit(HomeSuccess(sliderImageList: list));
      },
    );
  }

  void _updateImageSliders(List<SliderImageData> sliderList) {
    List<Widget> imageSliders = sliderList
        .map((item) => Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      child: Common.cacheCarouselSlider(item.image!),
    ))
        .toList();
    emit(HomeImageSlidersUpdated(imageSliders: imageSliders));
  }



}
