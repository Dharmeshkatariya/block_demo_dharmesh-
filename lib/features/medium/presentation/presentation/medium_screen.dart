
import 'package:block_demo_dharmesh/export.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../../core/widget/common.dart';
import '../../../../models/medium_data.dart';
import '../../../home/presentation/bloc/cubit/video_select_cubit.dart';
import '../bloc/cubit/medium_cubit.dart';

class MediumView extends StatefulWidget {
  const MediumView({super.key});

  @override
  State<MediumView> createState() => _MediumViewState();
}

class _MediumViewState extends State<MediumView> {

  @override
  void initState() {

    final videoIndex = context.read<VideoSelectionCubit>().state;
    context.read<MediumCubit>().getMedium(videoIndex);



    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Common.cmnAppBar(title: "Medium"),
      body: BlocConsumer<MediumCubit, MediumState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is MediumFailure) {
            return Center(child: Text(state.error));
          }
          if (state is! MediumSuccess) {
            return Center(
              child: Utility.loader()
            );
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

                          AnimationLimiter(
                            child: GridView.count(
                                primary: false,
                                shrinkWrap: true,

                                physics:
                                const NeverScrollableScrollPhysics(),
                                crossAxisSpacing: 3.h,
                                mainAxisSpacing: 3.5.w,
                                crossAxisCount: 2,
                                childAspectRatio: MediaQuery
                                    .of(context)
                                    .size
                                    .width /
                                    MediaQuery
                                        .of(context)
                                        .size
                                        .height *
                                    1.55,
                                children: AnimationConfiguration
                                    .toStaggeredList(
                                  duration:
                                  const Duration(milliseconds: 375),
                                  childAnimationBuilder: (widget) =>
                                      SlideAnimation(
                                        horizontalOffset:
                                        MediaQuery
                                            .of(context)
                                            .size
                                            .width /
                                            2,
                                        child: FadeInAnimation(child: widget),
                                      ),
                                  children: List.generate(
                                    state.mediumList.length,
                                        (index) {
                                      MediumData mediumData = state
                                          .mediumList[index];

                                      return _gridItemView(mediumData);
                                    },
                                  ),
                                )),
                          ),
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

  Widget _gridItemView(MediumData mediumData) {
    return GestureDetector(
      onTap: () {
        GetNav.toNamedWithArgs(context, Routes.standardScreen, {
          "medium": mediumData,
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
              child: Common.bookCardNetworkImg(mediumData.image!),
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
                    mediumData.name!,
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
