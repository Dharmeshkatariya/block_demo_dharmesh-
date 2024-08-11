//:::::::::::::::::::::::::::::::::::::::DART SUPPORT:::::::::::::::::::::::::::::::::::::::::::*/

export 'dart:convert';
export 'package:flutter/foundation.dart';
export 'package:flutter/services.dart';
export 'package:flutter/material.dart';
export 'package:flutter/gestures.dart';
export 'dart:async';

//:::::::::::::::::::::::::::::::::::::::PLUGINS:::::::::::::::::::::::::::::::::::::::::::*/

export 'package:image_picker/image_picker.dart';
export 'package:shared_preferences/shared_preferences.dart';
export 'package:flutter_svg/flutter_svg.dart';
export 'package:flutter_spinkit/flutter_spinkit.dart';
export 'package:flutter_screenutil/flutter_screenutil.dart';
export 'package:cached_network_image/cached_network_image.dart';
export 'package:permission_handler/permission_handler.dart';
export 'package:lottie/lottie.dart';
export 'package:change_app_package_name/change_app_package_name.dart';
export 'package:path_provider/path_provider.dart';
export 'package:introduction_screen/introduction_screen.dart';
export 'package:firebase_core/firebase_core.dart';
export 'package:get_it/get_it.dart';



//:::::::::::::::::::::::::      CORE     ::::::::::::::::::::::::::::*/


export 'package:block_demo_dharmesh/core/api_providers/api_end_points.dart';
export 'package:block_demo_dharmesh/core/api_providers/api_service.dart';
export 'package:block_demo_dharmesh/core/api_providers/dio_api_client.dart';
export 'package:block_demo_dharmesh/core/asset/asset.dart';
export 'package:block_demo_dharmesh/core/colors/app_colors.dart';
export 'package:block_demo_dharmesh/core/config/language_detector.dart';
export 'package:block_demo_dharmesh/core/constants/constants.dart';
export 'package:block_demo_dharmesh/core/db/local_storage_service.dart';


export 'package:block_demo_dharmesh/core/errors/exceptions.dart';
export 'package:block_demo_dharmesh/core/errors/failures.dart';
export 'package:block_demo_dharmesh/core/networks/network_info.dart';
export 'package:block_demo_dharmesh/core/themes/app_theme.dart';
export 'package:block_demo_dharmesh/core/themes/theme_detector.dart';

export 'package:block_demo_dharmesh/core/usecase/usecase.dart';
export 'package:block_demo_dharmesh/core/utils/common_btn.dart';
export 'package:block_demo_dharmesh/core/utils/date_converter.dart';
export 'package:block_demo_dharmesh/core/utils/date_time.dart';
export 'package:block_demo_dharmesh/core/utils/responsive_screen.dart';
export 'package:block_demo_dharmesh/core/utils/screen_sizes.dart';
export 'package:block_demo_dharmesh/core/utils/utility.dart';




//:::::::::::::::::::::::::      ROUTES   :::::::::::::::::::::::::::::::::::::::::::*/

export 'package:block_demo_dharmesh/core/routes/animated_page_route.dart';
export 'package:block_demo_dharmesh/core/routes/app_pages.dart';
export 'package:block_demo_dharmesh/core/routes/getnav.dart';
export 'package:block_demo_dharmesh/core/routes/app_routes.dart';

//:::::::::::::::::::::::::      WEATHER   :::::::::::::::::::::::::::::::::::::::::::*/

// data and domain


export 'package:block_demo_dharmesh/features/weather/data/data_resource/weather_network_db.dart';
export 'package:block_demo_dharmesh/features/weather/data/data_resource/weather_network_db_impl.dart';
export 'package:block_demo_dharmesh/features/weather/data/repository_impl/weather_reposity_impl.dart';
export 'package:block_demo_dharmesh/features/weather/domain/repository/weather_repository.dart';
export 'package:block_demo_dharmesh/features/weather/domain/use_cases/get_weather_usecase.dart';



// presentation

export 'features/auth/data/datasource/network_db/auth_network_db.dart';
export 'features/auth/data/datasource/network_db/auth_network_db_impl.dart';
export 'features/auth/data/repositories/auth_repository_impl.dart';
export 'features/auth/domain/repositories/auth_repository.dart';
export 'features/auth/domain/usecases/auth_sendOTP_usecase.dart';
export 'features/auth/domain/usecases/auth_verifyOTP_usecase.dart';
export 'features/auth/domain/usecases/createUser_profile_usercase.dart';
export 'features/auth/domain/usecases/create_user_usecase.dart';
export 'features/auth/domain/usecases/forgot_password_usecase.dart';
export 'features/auth/domain/usecases/login_user_usecase.dart';

//:::::::::::::::::::::::::      AUTH   :::::::::::::::::::::::::::::::::::::::::::*/





// presentation


export '../../features/auth/presentation/bloc/cubit/auth_cubit.dart';
export '../../features/auth/presentation/screens/auth_screens/auth_main_screen.dart';
export '../../features/auth/presentation/screens/auth_screens/create_profile_screen.dart';
export '../../features/auth/presentation/screens/auth_screens/login_screen.dart';
export '../../features/auth/presentation/screens/auth_screens/signup_screen.dart';
export '../../features/auth/presentation/screens/splash_screen/main_splash_screen.dart';
export 'package:block_demo_dharmesh/features/weather/presentation/bloc/cubit/weather_cubit.dart';
export 'package:block_demo_dharmesh/features/weather/presentation/screen/weather_screen.dart';
export 'package:flutter_bloc/flutter_bloc.dart';