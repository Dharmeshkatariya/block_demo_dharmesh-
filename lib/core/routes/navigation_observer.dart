
import 'package:block_demo_dharmesh/features/home/presentation/bloc/cubit/home_cubit.dart';

import '../../export.dart';

class AppNavigateObserver extends NavigatorObserver {
  final HomeCubit _homeCubit = HomeCubit();

  @override
  void didPop(Route route, Route? previousRoute) {

    if (previousRoute?.settings.name == Routes.homeScreen) {
      _homeCubit.getApiSliderImages();
    }
  }

  @override
  void didPush(Route route, Route? previousRoute) {}


}
