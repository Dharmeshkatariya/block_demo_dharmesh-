import 'package:block_demo_dharmesh/core/routes/app_routes.dart';
import 'package:block_demo_dharmesh/core/routes/getnav.dart';
import 'package:block_demo_dharmesh/core/utils/common_btn.dart';
import 'package:block_demo_dharmesh/core/widget/custom_textfilled.dart';
import 'package:block_demo_dharmesh/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/user_credentail_entity.dart';
import '../../widgets/back_app_bar.dart';
import 'forgot_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  UserCredentialEntity userCredentialEntity =
      UserCredentialEntity(email: "", password: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: BackAppBar(context, ""),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, Routes.weatherScreen, (route) => false);
            BlocProvider.of<AuthCubit>(context).emit(AuthInitial());
          }
          if (state is AuthFailure) {
            Utility.errorShowSnackBar(context: context , msg: state.error) ;
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Utility.loader();
          } else {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Login ',
                      textAlign: TextAlign.center,
                      style: introStyles(22.h),
                    ),
                  ),
                  35.verticalSpace,
                  CustomTextField(
                    onChanged: (value) {
                      setState(() {
                        userCredentialEntity.email = value;
                      });
                    },
                    hintText: 'Email',
                    prefixIcon: Icon(Icons.email),
                    fillColor: AppColors.authFiledColor.withOpacity(0.3),
                    textStyle:
                        TextStyle(color: AppColors.black, fontSize: 12.h),
                  ),
                  15.verticalSpace,
                  CustomTextField(
                    hintText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                    fillColor: AppColors.authFiledColor.withOpacity(0.3),
                    textStyle:
                    TextStyle(color: AppColors.black, fontSize: 12.h),
                    obscureText: true,
                    onChanged: (value) {
                      userCredentialEntity.password = value;
                    },
                  ),
                  15.verticalSpace,
                  InkWell(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => BlocProvider(
                        create: (context) => AuthCubit(),
                        child: const ForgotPasswordScreen(),
                      ),
                    )),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        'Forgot the password?',
                        style: introStyles(14.h),
                      ),
                    ),
                  ),
                  20.verticalSpace,
                  CommonButton(
                    text: "Sign in ",
                    color: AppColors.black,
                    ontap: () {
                      BlocProvider.of<AuthCubit>(context)
                          .loginUser(userCredentialEntity, context);
                    },
                  ),
                  10.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have account? ",
                        style: introStyles(15.h, color: Colors.black54),
                      ),
                      InkWell(
                        onTap: () {
                          GetNav.offNamed(context, Routes.signUpScreen);
                        },
                        child: Text(
                          "Sign up",
                          style: introStyles(14.h),
                        ),
                      )
                    ],
                  ),
                  15.verticalSpace,

                  15.verticalSpace,
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
