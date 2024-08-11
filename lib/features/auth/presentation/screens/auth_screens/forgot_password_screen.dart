import 'package:block_demo_dharmesh/core/colors/app_colors.dart';
import 'package:block_demo_dharmesh/core/utils/common_btn.dart';
import 'package:block_demo_dharmesh/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/asset/asset.dart';
import '../../bloc/cubit/auth_cubit.dart';
import '../../widgets/back_app_bar.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackAppBar(context, "Forgot Password"),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Email Sent Successfully"),
                backgroundColor: Colors.green,
              ),
            );
            Navigator.of(context).pop();
          }
          if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.black87,
                strokeWidth: 7,
              ),
            );
          } else {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Column(
                children: [
                  Image.asset(otp),
                  TextField(
                    style: TextStyle(fontSize: 12.h, color: AppColors.black),
                    controller: email,
                    decoration: InputDecoration(
                        fillColor: AppColors.authFiledColor.withOpacity(0.2),
                        hintText: "Enter your email address",
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  20.verticalSpace,
                  CommonButton(
                    text: "Reset Password",
                    ontap: () {
                      BlocProvider.of<AuthCubit>(context)
                          .resetPassword(email.text);
                    },
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
