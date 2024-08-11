part of 'medium_cubit.dart';

abstract class MediumState extends Equatable {
  const MediumState();
  List<Object> get props => [];

}

class MediumInitial extends MediumState {
  @override
  List<Object> get props => [];
}


class MediumFailure extends MediumState {
  String error;
  MediumFailure({required this.error});
  @override
  List<Object> get props => [error];
}

class MediumLoading extends MediumState {
}

class MediumSuccess extends MediumState {
  final List<MediumData> mediumList;

  const MediumSuccess({required this.mediumList});
  @override
  List<Object> get props => [mediumList];
}



