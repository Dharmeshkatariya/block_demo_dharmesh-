import 'package:block_demo_dharmesh/features/standard/presentation/bloc/cubit/standard_cubit.dart';
import 'package:block_demo_dharmesh/models/home_res_model.dart';

import '../../../../core/widget/common.dart';
import '../../../../export.dart';
import '../../../../models/medium_data.dart';
import '../../../home/presentation/bloc/cubit/video_select_cubit.dart';
import '../widget/card_grid.dart';

class StandardView extends StatefulWidget {
  const StandardView({super.key});

  @override
  State<StandardView> createState() => _StandardViewState();
}

class _StandardViewState extends State<StandardView> {
  MediumData? med;

  getArgument() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final args = GetNav.getArguments(context);
      if (args != null ) {
        med = args['medium'] as MediumData?;
        final videoIndex = context.read<VideoSelectionCubit>().state;
        context.read<StandardCubit>().getStandard(videoIndex, med!.id!);
      }

    });
  }

  @override
  void initState() {
    getArgument();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: med != null
          ? Common.cmnAppBar(title: med!.name!)
          : Common.cmnAppBar(title: "Subject"),
      body: BlocConsumer<StandardCubit, StandardState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is StandardFailure) {
            return Center(child: Text(state.error));
          }
          if (state is! StandardSuccess) {
            return Center(child: Utility.loader());
          }
          return SafeArea(
            bottom: true,
            top: true,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          5.verticalSpace,
                          CardGridCustomAnimation(
                            widgetList: List.generate(
                              state.standardList.length,
                                  (index) {
                                var standard = state.standardList[index] ;
                                return _gridItemView(standard);
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _gridItemView(StandardRes standard) {
    return GestureDetector(
      onTap: () {
        GetNav.toNamedWithArgs(context, Routes.subjectScreen, {
          "standard": standard,
        });
      },
      child: Container(
        color: AppColors.white.withOpacity(0.1),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.6),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Common.bookCardNetworkImg(standard.image!),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.navyBlue.withOpacity(0.5),
                  ),
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(
                      horizontal: 5.h,
                      vertical: 5.h),
                  child: Text(
                    standard.name!,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: poppinsSemiBold,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
