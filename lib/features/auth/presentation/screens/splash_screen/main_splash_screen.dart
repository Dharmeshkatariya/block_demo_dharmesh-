

import '../../../../../export.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  userLoginView() async {
    var firstLaunch =
        await LSProvider.getBool(LocalStorage.firstLaunch) ?? false;
    var login = await LSProvider.getBool(LocalStorage.keyLoggedIn) ?? false;

    if (firstLaunch) {
      if (login) {
        GetNav.offNamed(context ,Routes.homeScreen);
      } else {
        GetNav.offNamed(context ,Routes.authMainScreen);
      }
    } else {
      GetNav.offNamed(context ,Routes.onBoardingScreen);
    }
  }
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      userLoginView();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Image.asset("assets/images/on_first.png"),
    );
  }
}
