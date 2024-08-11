import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../export.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  PageController pageController = PageController();

  int current = 0;

  bool onLastPage = false;

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (!onLastPage) {
        pageController.nextPage(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeIn,
        );
      } else {
        savelaunch();
        _timer.cancel();
      }
    });
  }

  late Timer _timer;

  pageChanged(int index) {
    onLastPage = (index == 2);
    current = index;
    setState(() {});
  }

  savelaunch() async {
    await LSProvider.setBool(LocalStorage.firstLaunch, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      floatingActionButton: InkWell(
        child: GestureDetector(
          onTap: () {
            pageController.nextPage(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeIn);
          },
          child: current < 2
              ? Padding(
                padding:  EdgeInsets.only(bottom: 30.h),
                child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.appColor,
                        borderRadius: BorderRadius.circular(25)),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    child: const Text(
                      "Next",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
              )
              : const SizedBox.shrink(),
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          height: 600.h,
          width: 600.w,
          child: Stack(
            children: [
              PageView(
                onPageChanged: (index) {
                  pageChanged(index);
                },
                controller: pageController,
                children: [
                  OnboardingPage(
                    imagePath: onBoardingFirst,
                    title: 'Only Books Can Help You',
                    description:
                        "Learn a lot of new skills with our interesting lessons by our courses and solve tasks",
                    showButton: false,
                    onPressed: () {},
                  ),
                  const OnboardingPage(
                    imagePath: onBoardingSecond,
                    title: 'Learn on Your Time Schedule',
                    description:
                        'Learn a lot of new skills with our interesting lessons by our courses and solve tasks ',
                    showButton: false,
                  ),
                  OnboardingPage(
                    imagePath: onBoardingThird,
                    title: "Welcome to Ebook App",
                    description:
                        ' We have true friend in our life andthe books is that. Book has power tochanage yourself and make you morevaluable.',
                    showButton: true,
                    onPressed: () {
                      savelaunch();
                      GetNav.offNamed(context, Routes.authMainScreen);
                    },
                  ),
                ],
              ),
              current < 2
                  ? Positioned(
                      bottom: 0.h,
                      left: 50.w,
                      child: SmoothPageIndicator(
                        controller: pageController,
                        count: 3,
                        effect: ExpandingDotsEffect(
                          dotHeight: 12,
                          dotWidth: 12,
                          dotColor: AppColors.grey,
                          activeDotColor: AppColors.appColor,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
              Positioned(
                right: 15.h,
                top: 5.w,
                child: SizedBox(
                  child: InkWell(
                    onTap: () {
                      pageController.jumpToPage(2);
                    },
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(252, 52, 58, 64),
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final bool showButton;
  final VoidCallback? onPressed;

  const OnboardingPage({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    this.showButton = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            child: Image.asset(
              imagePath,
              fit: BoxFit.fitWidth,
              scale: 0.83,
            ),
          ),
          5.verticalSpace,
          Container(
            width: 350.w,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            height: 150.h,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontFamily: poppinsSemiBold,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromARGB(252, 52, 58, 64),
                  ),
                ),
                1.verticalSpace,
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: const TextStyle(
                      fontWeight: FontWeight.w300,
                      fontFamily: poppinsRegular,
                      color: Color.fromARGB(252, 52, 58, 64),
                      fontSize: 15,
                    ),
                    children: [
                      TextSpan(
                        text: description,
                      ),
                    ],
                  ),
                ),
                25.verticalSpace,
                if (showButton)
                  CustomButton(
                      height: 40.h,
                      width: 150.w,
                      ontap: onPressed,
                      text: "Get Started"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
