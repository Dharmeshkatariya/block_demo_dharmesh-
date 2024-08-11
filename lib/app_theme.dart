// import 'app_colors.dart';
// import 'asset.dart';
// import 'export.dart';
//
// class AppTheme {
//   static final ThemeData darkTheme = ThemeData(
//       brightness: Brightness.dark,
//       primaryColor: AppColors.appColor,
//       canvasColor: AppColors.white,
//       scaffoldBackgroundColor: AppColors.appColor,
//       buttonTheme: _buildButtonTheme(),
//       fontFamily: latoRegular,
//       // searchViewTheme: _searchViewThemeData,
//       inputDecorationTheme: _buildInputDecorationTheme(),
//       secondaryHeaderColor: AppColors.darkGrey,
//       textTheme: _buildTextTheme(),
//       appBarTheme: _buildAppBarTheme());
//
//   static final SearchViewThemeData _searchViewThemeData =
//       SearchViewThemeData(backgroundColor: AppColors.appColor);
//   static final ThemeData lightTheme = ThemeData(
//     brightness: Brightness.light,
//     primaryColor: AppColors.appColor,
//     switchTheme: SwitchThemeData(
//       thumbColor:
//           MaterialStateProperty.resolveWith<Color>((states) => AppColors.white),
//     ),
//     canvasColor: AppColors.white,
//     scaffoldBackgroundColor: AppColors.white,
//     fontFamily: latoRegular,
//     secondaryHeaderColor: AppColors.darkGrey,
//     textTheme: _buildTextTheme(),
//   );
//
//   // static TextTheme _buildText() {
//   //   return  TextTheme(
//   //     displayLarge: TextStyle(
//   //         fontFamily: 'Roboto',
//   //         color: Colors.black54,
//   //         fontSize: 50,
//   //         fontWeight: FontWeight.normal),
//   //     displayMedium: TextStyle(
//   //         fontFamily: 'Roboto',
//   //         color: Colors.black54,
//   //         fontSize: 40,
//   //         fontWeight: FontWeight.normal),
//   //     displaySmall: TextStyle(
//   //         fontFamily: 'Roboto',
//   //         color: Colors.black54,
//   //         fontSize: 36,
//   //         fontWeight: FontWeight.normal),
//   //     headlineLarge: TextStyle(
//   //         fontFamily: 'Roboto',
//   //         color: Colors.black54,
//   //         fontSize: 32,
//   //         fontWeight: FontWeight.normal),
//   //     headlineMedium: TextStyle(
//   //         fontFamily: 'Roboto',
//   //         color: Colors.black54,
//   //         fontSize: 28,
//   //         fontWeight: FontWeight.normal),
//   //     headlineSmall: TextStyle(
//   //         fontFamily: 'Roboto',
//   //         color: Colors.black87,
//   //         fontSize: 24,
//   //         fontWeight: FontWeight.normal),
//   //     titleLarge: TextStyle(
//   //         fontFamily: 'Roboto',
//   //         color: Colors.black87,
//   //         fontSize: 22,
//   //         fontWeight: FontWeight.w500),
//   //     titleMedium: TextStyle(
//   //         fontFamily: 'Roboto',
//   //         color: Colors.black87,
//   //         fontSize: 16,
//   //         fontWeight: FontWeight.w500),
//   //     titleSmall: TextStyle(
//   //         fontFamily: 'Roboto',
//   //         color: Colors.black,
//   //         fontSize: 14,
//   //         fontWeight: FontWeight.w500),
//   //     bodyLarge: TextStyle(
//   //         fontFamily: 'Roboto',
//   //         color: Colors.black87,
//   //         fontSize: 16,
//   //         fontWeight: FontWeight.normal),
//   //     bodyMedium: TextStyle(
//   //         fontFamily: 'Roboto',
//   //         color: Colors.black87,
//   //         fontSize: 14,
//   //         fontWeight: FontWeight.normal),
//   //     bodySmall: TextStyle(
//   //         fontFamily: 'Roboto',
//   //         color: Colors.black54,
//   //         fontSize: 12,
//   //         fontWeight: FontWeight.normal),
//   //     labelLarge: TextStyle(
//   //         fontFamily: 'Roboto',
//   //         color: Colors.black87,
//   //         fontSize: 14,
//   //         fontWeight: FontWeight.w500),
//   //     labelMedium: TextStyle(
//   //         fontFamily: 'Roboto',
//   //         color: Colors.black,
//   //         fontSize: 12,
//   //         fontWeight: FontWeight.w500),
//   //     labelSmall:  TextStyle(
//   //         fontFamily: 'Roboto',
//   //         color: Colors.black,
//   //         fontSize: 11,
//   //         fontWeight: FontWeight.w500),
//   //     button:  TextStyle(
//   //         fontFamily: 'Roboto',
//   //         color: Colors.black,
//   //         fontSize: 11,
//   //         fontWeight: FontWeight.w500),
//   //   );
//   // }
//
//   static TextTheme _buildTextTheme() {
//     return TextTheme(
//
//     );
//   }
//
//   static ButtonThemeData _buildButtonTheme() {
//     return ButtonThemeData(
//       buttonColor: AppColors.yellow,
//       colorScheme: const ColorScheme.light().copyWith(
//         primary: AppColors.yellow,
//       ),
//     );
//   }
//
//   static AppBarTheme _buildAppBarTheme() {
//     return AppBarTheme(
//       backgroundColor: AppColors.white,
//       elevation: 0,
//       iconTheme: _buildIconTheme(),
//     );
//   }
//
//   static IconThemeData _buildIconTheme() {
//     return IconThemeData(
//       color: AppColors.white,
//     );
//   }
//
//   static InputDecorationTheme _buildInputDecorationTheme() {
//     return InputDecorationTheme(
//       fillColor: AppColors.authFiledColor.withOpacity(0.3),
//       filled: true,
//       floatingLabelBehavior: FloatingLabelBehavior.always,
//       border: OutlineInputBorder(
//         borderSide: BorderSide.none,
//         borderRadius: BorderRadius.circular(5),
//       ),
//       focusedBorder: OutlineInputBorder(
//         borderSide: BorderSide(
//           color: AppColors.red,
//           width: 2,
//         ),
//         borderRadius: BorderRadius.circular(5),
//       ),
//       enabledBorder: OutlineInputBorder(
//         borderSide: BorderSide(
//           color: AppColors.red,
//           width: 1,
//         ),
//         borderRadius: BorderRadius.circular(5.r),
//       ),
//       errorBorder: OutlineInputBorder(
//         borderSide: BorderSide(
//           color: AppColors.red,
//           width: 2,
//         ),
//         borderRadius: BorderRadius.circular(5.r),
//       ),
//       focusedErrorBorder: OutlineInputBorder(
//         borderSide: BorderSide(
//           color: AppColors.red,
//           width: 2,
//         ),
//         borderRadius: BorderRadius.circular(5.r),
//       ),
//       contentPadding: EdgeInsets.all(13.0.sp),
//       alignLabelWithHint: false,
//     );
//   }
// }
