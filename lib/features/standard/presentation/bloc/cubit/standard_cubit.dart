import 'package:bloc/bloc.dart';
import 'package:block_demo_dharmesh/features/standard/domain/use_cases/standard_book_use_cases.dart';
import 'package:block_demo_dharmesh/features/standard/domain/use_cases/standard_video_use_cases.dart';
import 'package:block_demo_dharmesh/models/home_res_model.dart';
import 'package:equatable/equatable.dart';

import '../../../../../injection_container.dart';

part 'standard_state.dart';

class StandardCubit extends Cubit<StandardState> {
  StandardCubit() : super(StandardInitial());

  Future<void> getStandard(int index, int id ) async {
    if (index == 1) {
      _getVideoStandard(id);
    } else {
      _getStandard(id);
    }
  }

  _getStandard(mediumId) async {
    var user = await locator.call<GetStandardBookUseCase>().getStandardApi(
      mediumId: mediumId
    );
    user.fold(
      (failure) => emit(StandardFailure(error: failure.message)),
      (result) => emit(StandardSuccess(standardList: result)),
    );
  }

  _getVideoStandard(mediumId) async {
    var user = await locator
        .call<GetStandardBookVideoApiUseCase>()
        .getStandardVideoApi(mediumId :mediumId);
    user.fold(
      (failure) => emit(StandardFailure(error: failure.message)),
      (result) => emit(StandardSuccess(standardList: result)),
    );
  }
}
