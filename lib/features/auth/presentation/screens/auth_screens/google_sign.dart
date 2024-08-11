import 'package:block_demo_dharmesh/core/utils/utility.dart';

import '../../../../../core/widget/common.dart';
import '../../../../../export.dart';

class GoogleSignInScreen extends StatefulWidget {
  const GoogleSignInScreen({super.key});

  @override
  State<GoogleSignInScreen> createState() => _GoogleSignInScreenState();
}

class _GoogleSignInScreenState extends State<GoogleSignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          // if (state is AuthGoogleSuccess) {
          //
          // }
          if (state is AuthFailure) {
            Utility.showSnackBar("Login failed",context);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return  Center(
              child: Utility.loader(),
            );
          } else {
            return Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 25.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  5.verticalSpace,
                  5.verticalSpace,
                  5.verticalSpace,
                  Common.circleAvatarUser(onBoardingFirst),
                 25.verticalSpace,
                  Text(
                    // "Login With Mobile",
                    "Sign in",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColors.black,
                        fontFamily: poppinsSemiBold,
                        fontWeight: FontWeight.w400),
                  ),
                  25.verticalSpace,


                  SocialLoginBtn(
                      path: google,
                      height: 50.h,
                      width: 250.w,
                      text: "Google",
                      onPressed: () async {
                        BlocProvider.of<AuthCubit>(context)
                            .signInWithGoogle(context);
                      })
                ],
              ),
            );
          }
        },
      ),
    );
  }


}

class SocialLoginBtn extends StatelessWidget {
  final String path;
  final String text;
  double? height;

  double? width;

  final Function() onPressed;

  SocialLoginBtn({
    Key? key,
    required this.path,
    required this.text,
    this.height,
    this.width,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 50.h,
      width: width ?? 150.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),
      child: GestureDetector(
        onTap: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _imgIcon(path),
            5.horizontalSpace,
            Text(
              text,
              style: TextStyle(
                color: AppColors.darkGrey,
                fontFamily: poppinsSemiBold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _imgIcon(String img) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(8),
      child: Image.asset(
        img,
        height: 24,
        width: 24,
        fit: BoxFit.contain,
      ),
    );
  }
}
