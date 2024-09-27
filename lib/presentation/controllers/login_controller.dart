import 'dart:developer';
import 'package:chatsapp/data/middlewares/network_caller.dart';
import 'package:chatsapp/data/middlewares/user_auth_controller.dart';
import 'package:chatsapp/data/models/network_reponse.dart';
import 'package:chatsapp/data/utils/urls.dart';
import 'package:chatsapp/presentation/controllers/user_controller.dart';
import 'package:chatsapp/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../data/models/user_model.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void login() async{
    if(!formKey.currentState!.validate()) return;
    EasyLoading.show(status: 'Logging in...',dismissOnTap: false,maskType: EasyLoadingMaskType.black);
    try{
      NetworkResponse response = await NetworkCaller.postRequest(
        url: Urls.login,
        body: {
          'email': emailController.text,
          'password': passwordController.text,
        },
      );
      if(response.isSuccess){
        UserController.updateUser(User.fromJson(response.responseData));
        AuthController.setToken(response.responseData['token']);
      }
    }catch(error){
      EasyLoading.showToast('Failed!',toastPosition: EasyLoadingToastPosition.bottom,);
      log(error.toString());
    }finally{
      EasyLoading.dismiss();
    }
    emailController.clear();
    passwordController.clear();
    Get.offAll(() => const HomeScreen());
  }


  bool passObscure = true;
  void toggleObscureness() {
    passObscure = !passObscure;
    update();
  }

  bool passFocus = false;
  void passIconActive(bool value) {
    passFocus = value;
    update();
  }

  bool emailFocus = false;
  void emailIconActive(bool value) {
    emailFocus = value;
    update();
  }
}