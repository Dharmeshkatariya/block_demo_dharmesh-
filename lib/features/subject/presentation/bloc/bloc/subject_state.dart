part of 'subject_bloc.dart';

abstract class SubjectState extends Equatable {
  const SubjectState();

  @override
  List<Object> get props => [];
}
class SubjectListLoading extends SubjectState {}

class SubjectListEmpty extends SubjectState {
  final String message;

  const SubjectListEmpty(this.message);

  @override
  List<Object> get props => [message];
}


class SubjectFailure extends SubjectState {
  final String error;

  const SubjectFailure({required this.error});

  @override
  List<Object> get props => [error];
}

class SubjectSuccess extends SubjectState {
  final List<Subject> subjectList;

  const SubjectSuccess({required this.subjectList});
  @override
  List<Object> get props => [subjectList];
}

class SubjectInitial extends SubjectState {
  @override
  List<Object> get props => [];
}
