part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();
  @override
  List<Object> get props => [];
}



class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}


class HomeFailure extends HomeState {
  String error;
  HomeFailure({required this.error});
  @override
  List<Object> get props => [error];
}

class HomeLoading extends HomeState {
}

class HomeSuccess extends HomeState {
  final List<SliderImageData> sliderImageList;

  const HomeSuccess({required this.sliderImageList});
  @override
  List<Object> get props => [sliderImageList];
}

class HomeImageSlidersUpdated extends HomeState {
  final List<Widget> imageSliders;
  const HomeImageSlidersUpdated({required this.imageSliders});

  @override
  List<Object> get props => [imageSliders];
}




class HomeUserSuccess extends HomeState {
  final UserDetailsResModel userDetailsResModel;

  const HomeUserSuccess({required this.userDetailsResModel});
  @override
  List<Object> get props => [userDetailsResModel];
}


