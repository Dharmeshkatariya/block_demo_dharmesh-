// ignore_for_file: unused_catch_clause, deprecated_member_use

import 'dart:convert';
import 'dart:developer';

import 'package:block_demo_dharmesh/models/medium_data.dart';
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import '../../models/chapter_data.dart';
import '../../models/feedback_data.dart';
import '../../models/home_res_model.dart';
import '../../models/slider_images.dart';
import '../../models/subject.dart';
import '../../models/update_user.dart';
import '../constants/constants.dart';
import '../utils/utility.dart';
import 'api_end_points.dart';
import 'dio_api_client.dart';

class API {
  static DioClient? dioClient;
  static bool enableLog = true;

  API() {
    var dio = Dio();
    dioClient = DioClient(ApiConstant.baseUrl, dio);
  }

//:::::::::::::::::::::::::::::::::::::::   LOGIN API   :::::::::::::::::::::::::::::::::::::::::::*/

  static Future loginApi({Map<String, dynamic>? body}) async {
    String? data;
    try {
      if (body!.isNotEmpty) {
        data = json.encode(body);
      }
      final response = await dioClient!.post(
        loginApiEnd,
        data: data,
        skipAuth: true,
      );
      if (enableLog) log(name: "LOGIN API RES", "$response");
      if (response['isSuccess'] == 1) {
        return UserDetailsResModel.fromJson(response);
      } else {
        return null;
      }
    } on DioException catch (err) {
      // showToastCmn(msg: err.response!.statusMessage!);
    }
  }

//:::::::::::::::::::::::::::::::::::::::   VERIFY OTP API   :::::::::::::::::::::::::::::::::::::::::::*/

  static Future verifyOtp({Map<String, dynamic>? body}) async {
    String? data;
    try {
      if (body!.isNotEmpty) {
        data = json.encode(body);
      }
      final response =
      await dioClient!.post(verifyOtpApiEnd, data: data, skipAuth: true);
      if (enableLog) log(name: "verifyOtp RES", "$response");

      if (response['isSuccess'] == 1) {
        return UserDetailsResModel.fromJson(response);
      } else {
        return null;
      }
    } on DioException catch (err) {
      // showToastCmn(msg: err.response!.statusMessage!);
    }
  }

//:::::::::::::::::::::::::::::::::::::::  LOG OUT  API   :::::::::::::::::::::::::::::::::::::::::::*/

  static Future logOutApi({Map<String, dynamic>? body}) async {
    try {

      final response = await dioClient!.post(logoutApiEnd, skipAuth: false);
      if (enableLog) log(name: "logOutApi RES", "$response");

      if (response['isSuccess'] == 1) {
        return true;
      } else {
        return null;
      }
    } on DioException catch (err) {
      // showToastCmn(msg: err.response!.statusMessage!);
    }
  }

//:::::::::::::::::::::::::::::::::::::::   USER PROFILE API   :::::::::::::::::::::::::::::::::::::::::::*/

  static Future updateUserProfile(
      String? mobile,
      String? name,
      String? email,
      String? city,
      String? image,
      String? district,
      String? tehsil,
      BuildContext? context,
      ) async {
    dio.FormData formData = dio.FormData.fromMap({
      "mobile": mobile,
      "name": name,
      "email": email,
      "city": city,
      "image": await MultipartFile.fromFile(image!, filename: "file"),
      "district": district,
      "tehsil": tehsil,
    });
    try {
      final response = await dioClient!.post(
        profileUpdateApiEnd,
        data: formData,
        skipAuth: false,
      );
      if (enableLog) log(name: "updateUserProfile RES", "$response");

      if (response['isSuccess'] == 1) {
        return UserDetailsResModel.fromJson(response);
      } else {
        return null;
      }
    } on DioException catch (err) {
      // showToastCmn(msg: err.response!.statusMessage!);

    }
  }

//:::::::::::::::::::::::::::::::::::::::   GET USER  PROFILE  API   :::::::::::::::::::::::::::::::::::::::::::*/

  static Future<Either<String, UserDetailsResModel>> getUserProfile() async {
    try {
      final response = await dioClient!.get(userProfileApiEnd, skipAuth: false);
      if (enableLog) log(name: "UserProfile RES", "$response");
      return Right(UserDetailsResModel.fromJson(response));
    } on DioException catch (err) {
      return Left(err.response!.statusMessage!);
    }
  }

//:::::::::::::::::::::::::::::::::::::::   HOME SLIDER IMAGES API   :::::::::::::::::::::::::::::::::::::::::::*/


  static Future<Either<String, List<SliderImageData>>> getHomeSliderApi() async {
    try {
      final response = await dioClient!.get(sliderApiEbd, skipAuth: false);
      if (enableLog) log(name: "getHomeSliderApi RES", "$response");
      List<dynamic> dataList = response["data"];
      List<SliderImageData> standardResList =
      dataList.map((data) => SliderImageData.fromJson(data)).toList();
      return Right(standardResList);
    } on DioException catch (err) {
      return Left(err.response!.statusMessage!);
    }
  }


  //:::::::::::::::::::::::::::::::::::::::  BOOK MEDIUM  API   :::::::::::::::::::::::::::::::::::::::::::*/

  static Future<Either<String, List<MediumData>>> getHomeMediumApi() async {
    try {
      final response = await dioClient!.get(bookMediumApiEnd, skipAuth: false);
      if (enableLog) log(name: "Home Medium Api RES", "$response");
      List<dynamic> dataList = response["data"];
      List<MediumData> standardResList =
      dataList.map((data) => MediumData.fromJson(data)).toList();
      return Right(standardResList);
    } on DioException catch (err) {
      return Left(err.response!.statusMessage!);
    }
  }

//:::::::::::::::::::::::::::::::::::::::   BOOK STANDARD API   :::::::::::::::::::::::::::::::::::::::::::*/

  static Future<Either<String, List<StandardRes>>> getStandardApi({int? mediumId}) async {
    try {
      final response =
      await dioClient!.get("$bookStandardApiEnd$mediumId", skipAuth: false);
      if (enableLog) log(name: "Home Standard Api RES", "$response");
      List<dynamic> dataList = response["data"];
      List<StandardRes> standardResList =
      dataList.map((data) => StandardRes.fromJson(data)).toList();
      return Right(standardResList);
    } on DioException catch (err) {
      return Left(err.response!.statusMessage!);
    }
  }

//:::::::::::::::::::::::::::::::::::::::   BOOK SUBJECT  API   :::::::::::::::::::::::::::::::::::::::::::*/
//
  static Future<Either<String, List<Subject>>> getSubjectApi({int? standardId}) async {
    try {
      final response = await dioClient!
          .get("$bookSubjectApiEnd$standardId", skipAuth: false);
      if (enableLog) log(name: "Subject Api RES", "$response");
      List<dynamic> dataList = response["data"];
      List<Subject> subjectList =
      dataList.map((data) => Subject.fromJson(data)).toList();
      return Right(subjectList);
    } on DioException catch (err) {
      return Left(err.response!.statusMessage!);
    }
  }

//:::::::::::::::::::::::::::::::::::::::   BOOK CHAPTER  API   :::::::::::::::::::::::::::::::::::::::::::*/

  static Future<List<ChapterData>?> getChapterApi({int? subjectId}) async {
    try {
      final response =
      await dioClient!.get("$bookChapterApiEnd$subjectId", skipAuth: false);
      if (enableLog) log(name: "Subject Api RES", "$response");

      if (response['isSuccess'] == 1) {
        List<dynamic> dataList = response["data"];
        List<ChapterData> chapterList =
        dataList.map((data) => ChapterData.fromJson(data)).toList();
        return chapterList;
      } else {
        return null;
      }
    } on DioException catch (err) {
      return null;
    }
  }

  //:::::::::::::::::::::::::::::::::::::::   VIDEO MEDIUM  API   :::::::::::::::::::::::::::::::::::::::::::*/

  static Future<Either<String, List<MediumData>>> getMediumVideoApi() async {
    try {
      final response = await dioClient!.get(videoMediumApiEnd, skipAuth: false);
      List<dynamic> dataList = response["data"];
      List<MediumData> standardResList =
      dataList.map((data) => MediumData.fromJson(data)).toList();
      return Right(standardResList);
    } on DioException catch (err) {
      return Left(err.response!.statusMessage!);

    }
  }

  //:::::::::::::::::::::::::::::::::::::::   VIDEO STANDARD  API   :::::::::::::::::::::::::::::::::::::::::::*/
  static Future<Either<String, List<StandardRes>>> getStandardVideoApi({int? mediumId}) async {
    try {
      final response = await dioClient!
          .get("$videoStandardApiEnd$mediumId", skipAuth: false);
      if (enableLog) log(name: " Standard video  Api RES", "$response");
      List<dynamic> dataList = response["data"];
      List<StandardRes> standardResList =
      dataList.map((data) => StandardRes.fromJson(data)).toList();
      return Right(standardResList);
    } on DioException catch (err) {
      return Left(err.response!.statusMessage!);

    }
  }

  //:::::::::::::::::::::::::::::::::::::::   VIDEO SUBJECT  API   :::::::::::::::::::::::::::::::::::::::::::*/

  static Future<Either<String, List<Subject>>> getSubjectVideoApi({int? standardId}) async {
    try {
      final response = await dioClient!
          .get("$videoSubjectApiEnd$standardId", skipAuth: false);
      if (enableLog) log(name: "Subject video Api RES", "$response");
      List<dynamic> dataList = response["data"];
      List<Subject> subjectList =
      dataList.map((data) => Subject.fromJson(data)).toList();
      return Right(subjectList);
    } on DioException catch (err) {
      return Left(err.response!.statusMessage!);
    }
  }

  //:::::::::::::::::::::::::::::::::::::::   VIDEO CHAPTER  API   :::::::::::::::::::::::::::::::::::::::::::*/

  static Future<List<ChapterData>?> getChapterVideoApi({int? subjectId}) async {
    try {
      final response = await dioClient!
          .get("$videoChapterApiEnd$subjectId", skipAuth: false);
      if (enableLog) log(name: "Video Chapter  Api RES", "$response");
      if (response['isSuccess'] == 1) {
        List<dynamic> dataList = response["data"];
        List<ChapterData> chapterList =
        dataList.map((data) => ChapterData.fromJson(data)).toList();
        return chapterList;
      } else {
        return null;
      }
    } on DioException catch (err) {
      return null;
    }
  }

  //:::::::::::::::::::::::::::::::::::::::   FEEDBACK  API END POINT  :::::::::::::::::::::::::::::::::::::::::::*/

  static Future feedBackCreatedApi({Map<String, dynamic>? body}) async {
    String? data;
    try {
      if (body!.isNotEmpty) {
        data = json.encode(body);
      }
      final response = await dioClient!.post(
        feedBackCreateApiEnd,
        data: data,
        skipAuth: false,
      );
      if (enableLog) log(name: "FeedBack created  API RES", "$response");
      if (response['isSuccess'] == 1) {
        return FeedBackResModel.fromJson(response);
      } else {
        return null;
      }
    } on DioException catch (err) {
      return null;
    }
  }

}
