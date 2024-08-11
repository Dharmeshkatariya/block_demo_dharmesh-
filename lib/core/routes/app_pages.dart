import 'package:block_demo_dharmesh/features/home/presentation/bloc/cubit/home_cubit.dart';
import 'package:block_demo_dharmesh/features/home/presentation/screen/home_screen.dart';
import 'package:block_demo_dharmesh/features/medium/presentation/bloc/cubit/medium_cubit.dart';
import 'package:block_demo_dharmesh/features/medium/presentation/presentation/medium_screen.dart';
import 'package:block_demo_dharmesh/features/standard/presentation/screen/standard_view.dart';
import 'package:block_demo_dharmesh/features/subject/presentation/bloc/bloc/subject_bloc.dart';

import '../../export.dart';
import '../../features/auth/presentation/screens/auth_screens/google_sign.dart';
import '../../features/auth/presentation/screens/splash_screen/onboaridng.dart';
import '../../features/standard/presentation/bloc/cubit/standard_cubit.dart';
import '../../features/subject/presentation/presentation/subject_view.dart';

class AppPages {
  static const INITIAL = Routes.splashScreen;

  static Map<String, WidgetBuilder> routes = {
    Routes.splashScreen: (context) => const SplashView(),
    Routes.onBoardingScreen: (context) => const OnBoardingView(),
    Routes.googleSignInScreen: (context) => BlocProvider(
          create: (context) => AuthCubit(),
          child: const GoogleSignInScreen(),
        ),
    Routes.weatherScreen: (context) => BlocProvider(
          create: (context) => WeatherCubit(),
          child: const WeatherScreen(),
        ),
    Routes.mediumScreen: (context) => BlocProvider(
          create: (context) => MediumCubit(),
          child: const MediumView(),
        ),
    Routes.standardScreen: (context) => BlocProvider(
          create: (context) => StandardCubit(),
          child: const StandardView(),
        ),

    Routes.subjectScreen: (context) => BlocProvider(
      create: (context) => SubjectBloc(),
      child: const SubjectView(),
    ),

    Routes.homeScreen: (context) => BlocProvider(
          create: (context) => HomeCubit(),
          child: const HomeScreen(),
        ),
    Routes.authMainScreen: (context) => const AuthMainScreen(),
    Routes.signUpScreen: (context) => BlocProvider(
          create: (context) => AuthCubit(),
          child: const SignUpScreen(),
        ),
    Routes.loginScreen: ((context) => BlocProvider(
          create: (context) => AuthCubit(),
          child: const LoginScreen(),
        )),
    Routes.createProfile: (context) => BlocProvider(
          create: (context) => AuthCubit(),
          child: const CreateProfileScreen(),
        ),
  };
}
