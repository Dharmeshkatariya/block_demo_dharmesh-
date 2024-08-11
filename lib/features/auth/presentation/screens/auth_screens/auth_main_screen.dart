
import 'package:block_demo_dharmesh/core/utils/common_btn.dart';
import 'package:block_demo_dharmesh/export.dart';
import 'package:block_demo_dharmesh/features/auth/presentation/screens/auth_screens/phone_auth_screen.dart';

class AuthMainScreen extends StatelessWidget {
  const AuthMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            50.verticalSpace ,
            Image.asset(
              splash_login,
              width: 360,
            ),
            20.verticalSpace ,
            Text(
              "Let's you in",
              style: introStyles(25),
            ),
            20.verticalSpace ,

            CommonButton(
              text: 'Continue with Number',
              ontap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => BlocProvider(
                      create: (context) => AuthCubit(),
                      child: const PhoneAuthScreen(),
                    ),
                  ),
                );
              },
            ),
            20.verticalSpace ,

            CommonButton(
              text: 'Continue with Email',
              ontap: () {
                Navigator.of(context).pushNamed(Routes.loginScreen);
              },
            ),


            20.verticalSpace ,
            CommonButton(
              text: 'Continue with Google',
              ontap: () {
                Navigator.of(context).pushNamed(Routes.googleSignInScreen);
              },
            ),
            20.verticalSpace ,

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have account?  ",
                  style: introStyles(16, color: Colors.black54),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.signUpScreen);
                  },
                  child: Text(
                    "Sign up",
                    style: introStyles(16.h),
                  ),
                )
              ],
            ),
            10.verticalSpace ,
          ],
        ),
      ),
    );
  }

  Widget _customButton(String title, String iconpath) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          iconpath,
          width: 35.w,
        ),
        10.horizontalSpace,
        Text(
          title,
          style: introStyles(16.h),
        )
      ],
    );
  }
}
