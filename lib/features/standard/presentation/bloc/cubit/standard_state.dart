part of 'standard_cubit.dart';

abstract class StandardState extends Equatable {
  const StandardState();
  List<Object> get props => [];
  
}

class StandardInitial extends StandardState {
  @override
  List<Object> get props => [];
}



class StandardFailure extends StandardState {
  String error;
  StandardFailure({required this.error});
  @override
  List<Object> get props => [error];
}

class StandardLoading extends StandardState {
}

class StandardSuccess extends StandardState {
  final List<StandardRes> standardList;

  const StandardSuccess({required this.standardList});
  @override
  List<Object> get props => [standardList];
}