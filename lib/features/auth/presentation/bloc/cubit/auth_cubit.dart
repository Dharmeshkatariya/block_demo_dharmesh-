import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:block_demo_dharmesh/core/api_providers/api_service.dart';
import 'package:block_demo_dharmesh/core/db/auth_services.dart';
import 'package:block_demo_dharmesh/core/routes/getnav.dart';
import 'package:block_demo_dharmesh/core/utils/utility.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../core/db/local_storage_service.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../../../../injection_container.dart';
import '../../../../../models/update_user.dart';
import '../../../../../models/user_model.dart';
import '../../../domain/entities/user_credentail_entity.dart';
import '../../../domain/usecases/auth_sendOTP_usecase.dart';
import '../../../domain/usecases/auth_verifyOTP_usecase.dart';
import '../../../domain/usecases/createUser_profile_usercase.dart';
import '../../../domain/usecases/create_user_usecase.dart';
import '../../../domain/usecases/forgot_password_usecase.dart';
import '../../../domain/usecases/login_user_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());


  Future<void> createUser(
      UserCredentialEntity userCredentialEntity, BuildContext context) async {
    emit(AuthLoading());
    var authState = await locator
        .call<CreateUserUsecase>()
        .createuserUsecase(userCredentialEntity, context);
    if (authState.toString() == "Success") {
      emit(AuthSuccess());
    } else {
      emit(AuthFailure(error: authState.toString()));
    }
  }

  Future<void> createProfile(Map<String, String> usercredentials,
      BuildContext context, File image) async {
    emit(AuthLoading());
    var authstate = await locator
        .call<CreateUserProfileUseCase>()
        .createUserProfileUseCase(usercredentials, context, image);

    if (authstate.toString() == "Success") {
      emit(AuthSuccess());
    } else {
      emit(AuthFailure(error: authstate.toString()));
    }
  }

  Future<void> loginUser(
      UserCredentialEntity userCredentialEntity, BuildContext context) async {
    emit(AuthLoading());
    var authstate = await locator
        .call<LoginUserUseCase>()
        .loginuserusecase(userCredentialEntity, context);
    if (authstate.toString() == "Success") {
      emit(AuthSuccess());
    } else {
      emit(AuthFailure(error: authstate.toString()));
    }
  }

  Future<void> authsendOTP(String phoneNumber) async {
    emit(AuthLoading());
    var authstate = await locator
        .call<AuthSendOTPUseCase>()
        .authSendOTPUseCase(phoneNumber);
    if(authstate.toString().isNotEmpty){
      if (authstate.toString() == "Success") {
        emit(AuthSuccess());
      } else if (authstate.toString() == "AuthCodeSent") {
        emit(AuthCodeSentState());
      } else {
        emit(AuthFailure(error: authstate.toString()));
      }
    }

  }

  Future<void> authverifyOTP(int otp) async {
    emit(AuthLoading());
    var authstate =
        await locator.call<AuthVerifyOTPUseCase>().authVerifyOTPUsecase(otp);
    if (authstate.toString() == "Success") {
      emit(AuthSuccess());
    } else {
      emit(AuthFailure(error: authstate.toString()));
    }
  }

  Future<void> resetPassword(String email) async {
    emit(AuthLoading());
    var authstate = await locator
        .call<ForgotPasswordUseCase>()
        .forgotpasswordusecase(email);
    if (authstate.toString() == "Success") {
      emit(AuthSuccess());
    } else {
      emit(AuthFailure(error: authstate.toString()));
    }
  }
  bool _isFilled(UserModelDetail userModel) {
    if (userModel.email!.isEmpty ||
        userModel.name!.isEmpty ||
        userModel.image!.isEmpty ||
        userModel.city!.isEmpty ||
        userModel.mobile!.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  _saveUserDetail(userEmail, userName, userImage, city) async {
    UserProfile userProfile = UserProfile(
      email: userEmail ?? "",
      name: userName ?? "",
      mobileNumber: "",
      city: city ?? "",
      userProfileFileImg: "",
      userImage: userImage ?? "",
    );
    String jsonBody = json.encode(userProfile.toJson());
    await LSProvider.setString(LocalStorage.userProfile, jsonBody);
  }

  _saveUserLogin() async {
    await LSProvider.setBool(LocalStorage.keyLoggedIn, true);
  }

  _saveUserToken(String token) async {
    await LSProvider.setString(LocalStorage.token, token);
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      emit(AuthLoading());
      final googleAc = await AuthServices().signInWithGoogle();
      if (googleAc != null) {
        var map = {"google_id": googleAc.id};
        final apiRes = await API.loginApi(body: map);
        if (apiRes != null) {
          var userModel = apiRes.userModel;
          var token = userModel.token!;
          var filled = _isFilled(userModel);
          if (filled) {
            _saveUserDetail(userModel.email, userModel.name, userModel.image, userModel.city);
          } else {
            _saveUserDetail(googleAc.email, googleAc.displayName, googleAc.photoUrl, userModel.city);
          }
          _saveUserToken(token);
          _saveUserLogin();
          Utility.showSnackBar(apiRes.message,context);
          emit(AuthGoogleSuccess( userModelDetail: userModel,));
          GetNav.offNamed(context, Routes.homeScreen) ;
        } else {

          emit(AuthFailure(error: 'Login failed'));
        }
      } else {
        emit(AuthFailure(error: "Google sign-in failed"));
      }
    } catch (error) {
      await AuthServices().signOut(false,context);
      emit(AuthFailure(error: error.toString()));
    }
  }

}
