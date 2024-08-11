import 'package:block_demo_dharmesh/features/home/data/data_resource/home_network_db.dart';
import 'package:block_demo_dharmesh/features/home/data/data_resource/home_network_db_impl.dart';
import 'package:block_demo_dharmesh/features/home/data/repository_impl/home_repository_impl.dart';
import 'package:block_demo_dharmesh/features/home/domain/repository/home_repository.dart';
import 'package:block_demo_dharmesh/features/home/domain/use_cases/get_user_use_case.dart';
import 'package:block_demo_dharmesh/features/medium/data/data_source/medium_network_db.dart';
import 'package:block_demo_dharmesh/features/medium/data/data_source/medium_network_db_impl.dart';
import 'package:block_demo_dharmesh/features/medium/data/repositories/medium_repository_impl.dart';
import 'package:block_demo_dharmesh/features/medium/domain/repositories/medium_repository.dart';
import 'package:block_demo_dharmesh/features/medium/domain/use_cases/medium_use_cases.dart';
import 'package:block_demo_dharmesh/features/medium/domain/use_cases/medium_video_use_cases.dart';
import 'package:block_demo_dharmesh/features/standard/data/data_resource/standard_network_db_impl.dart';
import 'package:block_demo_dharmesh/features/standard/domain/repository/standard_repository.dart';
import 'package:block_demo_dharmesh/features/standard/domain/use_cases/standard_book_use_cases.dart';
import 'package:block_demo_dharmesh/features/standard/domain/use_cases/standard_video_use_cases.dart';
import 'package:block_demo_dharmesh/features/subject/data/data_source/remote/subject_network_db.dart';
import 'package:block_demo_dharmesh/features/subject/data/data_source/remote/subject_network_db_impl.dart';
import 'package:block_demo_dharmesh/features/subject/data/repository/subject_repo_impl.dart';
import 'package:block_demo_dharmesh/features/subject/domain/repository/subject_repository.dart';
import 'package:block_demo_dharmesh/features/subject/domain/use_cases/get_subject_book_usecases.dart';
import 'package:block_demo_dharmesh/features/subject/domain/use_cases/get_subject_video_usecase.dart';

import 'export.dart';
import 'features/home/domain/use_cases/get_slider_images_list.dart';
import 'features/standard/data/data_resource/standard_network_db.dart';
import 'features/standard/data/repository/standard_repository_impl.dart';

GetIt locator = GetIt.instance;

Future<void> initLocator() async {
  //usecase

  //usecase-weather
  locator.registerLazySingleton<GetWeatherDataUseCase>(
      () => GetWeatherDataUseCase(weatherRepo: locator()));

  //usecase-get user profile
  locator.registerLazySingleton<GetSliderImagesListCase>(
          () => GetSliderImagesListCase(homeRepo: locator()));
  locator.registerLazySingleton<GetUserDetailUseCase>(
          () => GetUserDetailUseCase(homeRepo: locator()));


  //usecase-auth
  locator.registerLazySingleton<CreateUserUsecase>(
          () => CreateUserUsecase(repository: locator()));
  locator.registerLazySingleton<CreateUserProfileUseCase>(
          () => CreateUserProfileUseCase(repository: locator()));
  locator.registerLazySingleton<LoginUserUseCase>(
          () => LoginUserUseCase(repository: locator()));
  locator.registerLazySingleton<AuthSendOTPUseCase>(
          () => AuthSendOTPUseCase(authRepository: locator()));
  locator.registerLazySingleton<AuthVerifyOTPUseCase>(
          () => AuthVerifyOTPUseCase(authRepository: locator()));
  locator.registerLazySingleton<ForgotPasswordUseCase>(
          () => ForgotPasswordUseCase(authRepository: locator()));


  //usecase-medium
  locator.registerLazySingleton<GetMediumBookUseCase>(
          () => GetMediumBookUseCase(mediumRepository: locator()));
  locator.registerLazySingleton<GetMediumBookVideoApiUseCase>(
          () => GetMediumBookVideoApiUseCase(mediumRepository: locator()));


  //usecase-standard
  locator.registerLazySingleton<GetStandardBookUseCase>(
          () => GetStandardBookUseCase(standardRepository: locator()));
  locator.registerLazySingleton<GetStandardBookVideoApiUseCase>(
          () => GetStandardBookVideoApiUseCase(standardRepository: locator()));


  locator.registerLazySingleton<GetSubjectBookUseCase>(
          () => GetSubjectBookUseCase(subjectRepository: locator()));
  locator.registerLazySingleton<GetSubjectVideoUseCase>(
          () => GetSubjectVideoUseCase(subjectRepository: locator()));

  //Repostory

  //repostory-weather

  locator.registerLazySingleton<WeatherRepository>(
      () => WeatherRepositoryImpl(weatherNetworkDb: locator()));

  //Repostory
  locator.registerLazySingleton<AuthRepository>(
          () => AuthRepositoryImpl(authnetworkDB: locator()));
  locator.registerLazySingleton<HomeRepository>(
          () => HomeRepositoryImpl(homeNetworkDb: locator()));
  locator.registerLazySingleton<MediumRepository>(
          () => MediumRepositoryImplImpl(mediumNetworkDb: locator()));
  locator.registerLazySingleton<StandardRepository>(
          () => StandardRepositoryImplImpl(standardNetworkDb: locator()));


  locator.registerLazySingleton<SubjectRepository>(
          () => SubjectRepoImpl(subjectNetworkDb: locator()));

  //Network DB
  locator.registerLazySingleton<AuthNetworkDB>(() => AuthNetworkDBImpl());
  locator.registerLazySingleton<WeatherNetworkDb>(() => WeatherNetworkDbImpl());
  locator.registerLazySingleton<HomeNetworkDb>(() => HomeNetworkDbImpl());
  locator.registerLazySingleton<MediumNetworkDb>(() => MediumNetworkDbImpl());
  locator.registerLazySingleton<StandardNetworkDb>(() => StandardNetworkDbImpl());
  locator.registerLazySingleton<SubjectNetworkDb>(() => SubjectNetworkDbImpl());


}
