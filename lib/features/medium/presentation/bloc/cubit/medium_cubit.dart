import 'package:bloc/bloc.dart';
import 'package:block_demo_dharmesh/features/medium/domain/use_cases/medium_use_cases.dart';
import 'package:block_demo_dharmesh/features/medium/domain/use_cases/medium_video_use_cases.dart';
import 'package:block_demo_dharmesh/models/medium_data.dart';
import 'package:equatable/equatable.dart';

import '../../../../../injection_container.dart';

part 'medium_state.dart';

class MediumCubit extends Cubit<MediumState> {
  MediumCubit() : super(MediumInitial());

  Future<void> getMedium(int index) async {
    if (index == 1) {
      _getVideoMedium();
    } else {
      _getMedium();
    }
  }

  _getMedium() async {
    var user = await locator.call<GetMediumBookUseCase>().getMediumApi();
    user.fold(
      (failure) => emit(MediumFailure(error: failure.message)),
      (result) => emit(MediumSuccess(mediumList: result)),
    );
  }

  _getVideoMedium() async {
    var user = await locator.call<GetMediumBookVideoApiUseCase>().getMediumVideoApi();
    user.fold(
      (failure) => emit(MediumFailure(error: failure.message)),
      (result) => emit(MediumSuccess(mediumList: result)),
    );
  }
}
