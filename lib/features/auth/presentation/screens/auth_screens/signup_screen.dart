import 'package:block_demo_dharmesh/core/colors/app_colors.dart';
import 'package:block_demo_dharmesh/core/routes/app_routes.dart';
import 'package:block_demo_dharmesh/core/routes/getnav.dart';
import 'package:block_demo_dharmesh/core/utils/common_btn.dart';
import 'package:block_demo_dharmesh/export.dart';
import '../../../../../core/widget/custom_textfilled.dart';
import '../../../domain/entities/user_credentail_entity.dart';
import '../../widgets/back_app_bar.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    with TickerProviderStateMixin {
  UserCredentialEntity userCredentialEntity =
      UserCredentialEntity(email: "", password: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: BackAppBar(context, ''),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            GetNav.toNamed(context, Routes.createProfile, );
            BlocProvider.of<AuthCubit>(context).emit(AuthInitial());
          }
          if (state is AuthFailure) {
            Utility.errorShowSnackBar(context: context, msg:state.error ) ;
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Utility.loader();
          } else {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 5.h),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    85.verticalSpace,
                    Center(
                      child: Text(
                        'Sign up',
                        textAlign: TextAlign.center,
                        style: introStyles(22.h),
                      ),
                    ),
                    35.verticalSpace,
                    CustomTextField(

                      obscureText: false,
                      hintText: "Email",
                      prefixIcon: const Icon(Icons.email),
                      fillColor: AppColors.authFiledColor.withOpacity(0.2),
                      textStyle: TextStyle(color: AppColors.black, fontSize: 12.h),
                      onChanged: (value) {
                        setState(() {
                          userCredentialEntity.email = value;
                        });
                      },
                      validator: (value) {
                        String pattern =
                            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                            r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                            r"{0,253}[a-zA-Z0-9])?)*$";
                        RegExp regex = RegExp(pattern);
                        if (value == null ||
                            value.isEmpty ||
                            !regex.hasMatch(value)) {
                          return 'Enter a valid email address';
                        } else {
                          return null;
                        }
                      },

                    ),
                    15.verticalSpace,
                    CustomTextField(
                      obscureText: true,
                      hintText: "Password",
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: const Icon(Icons.remove_red_eye),
                      fillColor: AppColors.authFiledColor.withOpacity(0.2),
                      textStyle: TextStyle(color: AppColors.black, fontSize: 12.h),
                      onChanged: (value) {
                        setState(() {
                          userCredentialEntity.password = value;
                        });
                      },
                      validator: (value) {
                        return null;
                      },
                    ),
                    20.verticalSpace,
                    CommonButton(
                      text: 'Sign up',
                      ontap: () {

                        BlocProvider.of<AuthCubit>(context)
                            .createUser(userCredentialEntity, context);
                      },
                    ),


                    20.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have account?  ",
                        ),
                        InkWell(
                          onTap: () {
                            GetNav.offNamed(context, Routes.loginScreen) ;
                          },
                          child: const Text(
                            "Sign in",
                            style: TextStyle(
                              // decoration: TextDecoration.underline
                            ),
                          ),
                        )
                      ],
                    ),
                    20.verticalSpace,



                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
