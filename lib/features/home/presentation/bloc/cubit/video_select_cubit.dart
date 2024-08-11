import 'package:bloc/bloc.dart';

class VideoSelectionCubit extends Cubit<int> {
  VideoSelectionCubit() : super(0);

  void selectVideo(int index) {
    emit(index);
  }
}
