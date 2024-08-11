import 'package:block_demo_dharmesh/export.dart';
import '../../widgets/back_app_bar.dart';
import 'otp_screen.dart';

class PhoneAuthScreen extends StatefulWidget {
  const PhoneAuthScreen({super.key});

  @override
  State<PhoneAuthScreen> createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController phonecontroller = TextEditingController();
    return Scaffold(
      appBar: BackAppBar(context, "Continue with Phone"),
      body: SingleChildScrollView(
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthCodeSentState) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => BlocProvider(
                    create: (context) => AuthCubit(),
                    child: const OtpScreen(),
                  ),
                ),
              );
            }
            if (state is AuthFailure) {
              Utility.errorShowSnackBar(context: context,msg: state.error) ;
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return Center(child: Utility.loader());
            } else {
              return Container(
                margin: const EdgeInsets.only(top: 50, left: 20, right: 20),
                child: Column(
                  children: [
                    Image.asset(otp),
                    TextField(
                      inputFormatters: [LengthLimitingTextInputFormatter(10)],
                      keyboardType: TextInputType.number,
                      controller: phonecontroller,
                      style: TextStyle(fontSize: 12.h, color: AppColors.black),
                      decoration: InputDecoration(
                          fillColor: AppColors.authFiledColor.withOpacity(0.2),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 14, horizontal: 15),
                            child: Text(
                              '+91',
                              style: TextStyle(
                                  fontSize: 12.h, color: AppColors.black),
                            ),
                          ),
                          hintText: "Enter your phone Number",
                          filled: true,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(1))),
                    ),
                    20.verticalSpace,
                    CommonButton(
                      text: "Continue",
                      ontap: () {
                        BlocProvider.of<AuthCubit>(context)
                            .authsendOTP("+91${phonecontroller.text}");
                      },
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
