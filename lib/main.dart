import 'package:firebase_core/firebase_core.dart';
import 'core/routes/navigation_observer.dart';
import 'export.dart';
import 'features/home/presentation/bloc/cubit/video_select_cubit.dart';
import 'firebase_options.dart';
import 'injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initLocator();
  await ScreenUtil.ensureScreenSize();
  API();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: AppColors.white),
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => VideoSelectionCubit(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GestureDetector(
              onTap: () =>
                  WidgetsBinding.instance.focusManager.primaryFocus!.unfocus(),
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                initialRoute: AppPages.INITIAL,
                navigatorObservers: [AppNavigateObserver()],
                routes: AppPages.routes,
                theme: ThemeData.light(useMaterial3: true),
                scrollBehavior: WebDragScrollBehavior(),
              ),
          );
        },
      ),
    );
  }
}
class WebDragScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
