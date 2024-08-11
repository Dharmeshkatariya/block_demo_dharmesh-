import 'package:block_demo_dharmesh/core/routes/app_routes.dart';
import 'package:block_demo_dharmesh/core/utils/common_btn.dart';
import 'package:block_demo_dharmesh/core/utils/utility.dart';
import 'package:block_demo_dharmesh/export.dart';

import '../../widgets/back_app_bar.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final FocusNode _focusNodeone = FocusNode();
  final FocusNode _focusNodetwo = FocusNode();
  final FocusNode _focusNodethree = FocusNode();
  final FocusNode _focusNodefour = FocusNode();
  final FocusNode _focusNodefive = FocusNode();
  final FocusNode _focusNodesix = FocusNode();

  String otp = "";

  void _onOtpChanged(String value) {
    otp += value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackAppBar(context, "Otp Verification"),
      body: Center(
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              Navigator.pushNamedAndRemoveUntil(
                  context, Routes.createProfile, (route) => false);
            }
            if (state is AuthFailure) {
              Utility.errorShowSnackBar(context: context, msg: state.error);
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return Center(
                child: Utility.loader(),
              );
            } else {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "OTP Verification",
                      style: TextStyle(fontSize: 20.h),
                    ),
                    25.verticalSpace ,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        OtpTextField(
                          currentFocusNode: _focusNodeone,
                          nextFocusNode: _focusNodetwo,
                          onChanged: _onOtpChanged,
                        ),
                        OtpTextField(
                          currentFocusNode: _focusNodetwo,
                          nextFocusNode: _focusNodethree,
                          onChanged: _onOtpChanged,
                        ),
                        OtpTextField(
                          currentFocusNode: _focusNodethree,
                          nextFocusNode: _focusNodefour,
                          onChanged: _onOtpChanged,
                        ),
                        OtpTextField(
                          currentFocusNode: _focusNodefour,
                          nextFocusNode: _focusNodefive,
                          onChanged: _onOtpChanged,
                        ),
                        OtpTextField(
                          currentFocusNode: _focusNodefive,
                          nextFocusNode: _focusNodesix,
                          onChanged: _onOtpChanged,
                        ),
                        OtpTextField(
                          currentFocusNode: _focusNodesix,
                          nextFocusNode: FocusNode(),
                          onChanged: _onOtpChanged,
                        ),
                      ],
                    ),
                    30.verticalSpace,
                    CommonButton(
                      ontap: () async {
                        BlocProvider.of<AuthCubit>(context)
                            .authverifyOTP(int.parse(otp));
                      },
                      text: "Verify OTP",
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

class OtpTextField extends StatelessWidget {
  final FocusNode currentFocusNode;
  final FocusNode nextFocusNode;
  final Function(String) onChanged;

  const OtpTextField({
    super.key,
    required this.currentFocusNode,
    required this.nextFocusNode,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .12,
      // height: 45.h,
      child: TextFormField(
        inputFormatters: [LengthLimitingTextInputFormatter(1)],
        keyboardType: TextInputType.number,
        style: TextStyle(color: AppColors.black, fontSize: 12.h),
        focusNode: currentFocusNode,
        textAlign: TextAlign.center,
        cursorColor: Colors.black,
        onChanged: (v) {
          onChanged(v);
          if (v.isNotEmpty) {
            nextFocusNode.requestFocus();
          }
        },
        decoration: InputDecoration(
          fillColor: Colors.grey.shade100,
          contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
          // Adjust
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2),
            borderSide: const BorderSide(color: Colors.black, width: 1.5),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2),
            borderSide: const BorderSide(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
