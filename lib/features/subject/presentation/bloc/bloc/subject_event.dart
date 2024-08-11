part of 'subject_bloc.dart';

abstract class SubjectEvent extends Equatable {
  const SubjectEvent();

  @override
  List<Object> get props => [];

}



class FetchSubjectBookData extends SubjectEvent {
  final int standardId;
  final int index;


  const FetchSubjectBookData({
    required this.standardId,
    required this.index,
  });

  @override
  List<Object> get props => [standardId, index];
}