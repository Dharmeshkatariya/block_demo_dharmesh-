import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:block_demo_dharmesh/features/subject/domain/use_cases/get_subject_book_usecases.dart';
import 'package:block_demo_dharmesh/features/subject/domain/use_cases/get_subject_video_usecase.dart';
import 'package:block_demo_dharmesh/models/subject.dart';
import 'package:equatable/equatable.dart';
import '../../../../../injection_container.dart';

part 'subject_event.dart';
part 'subject_state.dart';

class SubjectBloc extends Bloc<SubjectEvent, SubjectState> {
  SubjectBloc() : super(SubjectInitial()) {
    on<FetchSubjectBookData>((event, emit) async {
      final standardId = event.standardId;
      final index = event.index;
      emit(SubjectListLoading());
      if (index == 1) {
        await  _getSubjectBookVideo(standardId,emit);
      } else {
        await _getSubjectBook(standardId,emit);
      }
    });
  }

  Future _getSubjectBook(standardId ,Emitter<SubjectState> emit) async {
    var result = await locator.call<GetSubjectBookUseCase>().getSubjectBook(
      standardId: standardId,
    );
    result.fold(
          (failure) => emit(SubjectFailure(error: failure.message)),
          (success) {
        emit(SubjectSuccess(subjectList: success));
        if (success.isEmpty) {
          emit(const SubjectListEmpty("Empty Subject"));
        }
      },
    );
  }



  Future  _getSubjectBookVideo(standardId ,Emitter<SubjectState> emit) async {
    var result = await locator.call<GetSubjectVideoUseCase>().getSubjectVideo(
      standardId: standardId,
    );
    result.fold(
          (failure) => emit(SubjectFailure(error: failure.message)),
          (success) {
        emit(SubjectSuccess(subjectList: success));
        if (success.isEmpty) {
          emit(const SubjectListEmpty("Empty Subject"));
        }
      },
    );
  }
}
