import 'package:block_demo_dharmesh/export.dart';
import 'package:block_demo_dharmesh/features/home/presentation/bloc/cubit/home_cubit.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../bloc/cubit/video_select_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getApiSliderImages();
  }

  final CarouselController carouselController = CarouselController();
  int current = 0;

  List<String> titleList = [
    "Books",
    "Videos",
    "Coming Soon",
    "Coming Soon",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: _appBar(),
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          if (state is HomeFailure) {
            return Center(child: Text(state.error));
          }
          if (state is! HomeImageSlidersUpdated) {
            return Center(child: Utility.loader());
          }
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 2.2.h),
                    decoration: BoxDecoration(
                      color: AppColors.navyBlue.withOpacity(0.1),
                      // color: AppColors.white,
                    ),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          25.verticalSpace,
                          CarouselSlider(
                            items: state.imageSliders,
                            carouselController: carouselController,
                            options: CarouselOptions(
                              autoPlay: true,
                              viewportFraction: 1,
                              disableCenter: false,
                              aspectRatio: 2,
                              onPageChanged: (index, reason) {
                                current = index;
                                setState(() {});
                              },
                            ),
                          ),
                          8.verticalSpace ,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:
                                state.imageSliders.asMap().entries.map((entry) {
                              return GestureDetector(
                                onTap: () =>
                                    carouselController.animateToPage(entry.key),
                                child: Container(
                                  width: 12.h,
                                  height: 6.h,
                                  margin: EdgeInsets.symmetric(
                                      vertical: 7.w, horizontal: 3),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: (Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? AppColors.white
                                              : AppColors.black)
                                          .withOpacity(current == entry.key
                                              ? 0.9
                                              : 0.4)),
                                ),
                              );
                            } ).toList(),
                          ),
                          GridView.count(
                            primary: false,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisSpacing: 2.2,
                            mainAxisSpacing: 2.2.w,
                            crossAxisCount: 2,
                            childAspectRatio: 1.2222,
                            children: List.generate(titleList.length, (index) {
                              return _gridItemView(index);
                            }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  bool isDrawerOpen = false;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void toggle() {
    isDrawerOpen = !isDrawerOpen;
    if (isDrawerOpen) {
      scaffoldKey.currentState!.openDrawer();
    } else {
      scaffoldKey.currentState!.closeDrawer();
    }
  }

  PreferredSizeWidget _appBar() => AppBar(
        flexibleSpace: const SizedBox(),
        primary: true,
        backgroundColor: AppColors.navyBlue.withOpacity(0.1),
        toolbarHeight: 50.h,
        scrolledUnderElevation: 0,
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        leading: GestureDetector(
          onTap: () {
            toggle();
          },
          child: Container(
              margin: EdgeInsets.only(top: 5.w, left: 5.w),
              child: const Icon(
                Icons.menu_rounded,
              )),
        ),
        title: const Text(
          "E-book",
          style: TextStyle(
            fontFamily: poppinsSemiBold,
            fontWeight: FontWeight.w400,
          ),
        ),
      );


  Widget _gridItemView(int index) {
    var title = titleList[index];
    return GestureDetector(
      onTap: () {
        if (index == 0 || index == 1) {
          context.read<VideoSelectionCubit>().selectVideo(index);
          GetNav.toNamed(context ,Routes.mediumScreen);
        } else {}
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.r),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.navyBlue.withOpacity(0.1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (index == 0)
                  Image.asset(
                    bookIc,
                    height: 25.h,
                    width: 25.w,
                  )
                else if (index == 1)
                  Image.asset(
                    videoIc,
                    height: 25.h,
                    width: 25.w,
                  )
                else if (index == 2 || index == 3)
                  Image.asset(
                    comingSoonIc,
                    height: 25.h,
                    width: 25.w,
                  ),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontFamily: poppinsSemiBold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
