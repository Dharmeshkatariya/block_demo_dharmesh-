import 'dart:io';
import '../../../../../export.dart';
import '../../widgets/back_app_bar.dart';

class CreateProfileScreen extends StatefulWidget {
  const CreateProfileScreen({super.key});

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  final dropdown_tile_items = ['Male', 'Female', 'Others'];
  String? _dropdown_value;
  bool isImageLoaded = false;
  dynamic image;
  DateTime dateTime = DateTime.now();
  Map<String, String> userProfileCredentials = {
    'fullname': '',
    'nickname': '',
    'date': '',
    'email': '',
    'gender': ''
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackAppBar(context, 'Fill Your Profile'),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, Routes.weatherScreen, (route) => false);
          }
          if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.error),
            ));
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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 120,
                      width: 120,
                      child: Stack(
                        children: [
                          InkWell(
                            onTap: () {
                              _pickedImage();
                            },
                            child: CircleAvatar(
                              radius: 60,
                              backgroundColor: AppColors.appColor,
                              backgroundImage:
                                  isImageLoaded ? FileImage(image!) : null,
                              child: !isImageLoaded
                                  ? Icon(
                                      Icons.camera_alt_outlined,
                                      size: 40,
                                      color: Colors.grey.shade700,
                                    )
                                  : null,
                            ),
                          ),
                          Positioned(
                            bottom: 10.h,
                            right: 0,
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    10.verticalSpace,
                    TextFormField(
                      style: TextStyle(color: AppColors.black, fontSize: 12.h),
                      onChanged: (value) {
                        userProfileCredentials['fullname'] = value;
                      },
                      validator: (value) {},
                      decoration: InputDecoration(
                        fillColor: AppColors.authFiledColor.withOpacity(0.2),
                        hintText: 'Full Name',
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    15.verticalSpace,
                    TextFormField(
                      style: TextStyle(color: AppColors.black, fontSize: 12.h),
                      onChanged: (value) {
                        userProfileCredentials['nickname'] = value;
                      },
                      validator: (value) {},
                      decoration: InputDecoration(
                          fillColor: AppColors.authFiledColor.withOpacity(0.2),
                          hintText: 'Nickname',
                          filled: true,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    15.verticalSpace,
                    InkWell(
                      onTap: () async {
                        DateTime? newDate = await showDatePicker(
                                context: context,
                                initialDate: dateTime,
                                builder: (context, child) {
                                  return Theme(
                                    data: ThemeData.light().copyWith(
                                      colorScheme: const ColorScheme.light(
                                          primary: Colors.black87),
                                      buttonTheme: const ButtonThemeData(
                                          textTheme: ButtonTextTheme.primary),
                                    ),
                                    child: child!,
                                  );
                                },
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100))
                            .then((value) {
                          if (value != null) {
                            setState(() {
                              dateTime = value;
                              userProfileCredentials['date'] =
                                  '${dateTime.day}/${dateTime.month}/${dateTime.year}';
                            });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                              "No Date selected",
                              style: introStyles(18),
                            )));
                          }
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.h, vertical: 15.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.authFiledColor.withOpacity(0.2)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${dateTime.day}/${dateTime.month}/${dateTime.year}',
                              style: introStyles(12.h, color: AppColors.black),
                            ),
                            Icon(
                              Icons.cake,
                              color: AppColors.black,
                              size: 20,
                            )
                          ],
                        ),
                      ),
                    ),
                    15.verticalSpace,
                    TextFormField(
                        style:
                            TextStyle(color: AppColors.black, fontSize: 12.h),
                        onChanged: (value) {
                          userProfileCredentials['email'] = value;
                        },
                        validator: (value) {},
                        decoration: InputDecoration(
                            fillColor:
                                AppColors.authFiledColor.withOpacity(0.2),
                            suffixIcon: Icon(Icons.email),
                            hintText: 'Email',
                            filled: true,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10)))),
                    15.verticalSpace,
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15.h, vertical: 4.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.authFiledColor.withOpacity(0.2)),
                      width: double.infinity,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          iconEnabledColor: Colors.black26,
                          value: _dropdown_value,
                          isExpanded: true,
                          hint: Text(
                            'Select Gender',
                            style: TextStyle(
                                fontSize: 12.h, color: AppColors.black),
                          ),
                          items:
                              dropdown_tile_items.map(buildMenuItem).toList(),
                          onChanged: (value) {
                            setState(() {
                              _dropdown_value = value;
                              if (value != null) {
                                userProfileCredentials['gender'] = value;
                              } else {
                                userProfileCredentials['gender'] = 'Male';
                              }
                            });
                          },
                        ),
                      ),
                    ),
                    25.verticalSpace ,
                    CommonButton(
                      text: "Continue",
                      ontap: () {
                        if (image != null) {
                          BlocProvider.of<AuthCubit>(context).createProfile(
                              userProfileCredentials, context, image);
                        }
                      },
                    )
                  ],
                ),
              ),
            );
          }
        },
      ),
      // bottomNavigationBar:
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(fontSize: 12.h, color: AppColors.black),
        ),
      );

  Future<void> _pickedImage() async {
    var pickedImageFile = await ImagePicker.platform
        .getImage(source: ImageSource.gallery, imageQuality: 40, maxWidth: 150);
    setState(() {
      if (pickedImageFile == null) {
        return;
      }
      image = File(pickedImageFile.path);
      isImageLoaded = true;
    });
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        IterableProperty<String>('dropdown_tile_items', dropdown_tile_items));
  }
}
