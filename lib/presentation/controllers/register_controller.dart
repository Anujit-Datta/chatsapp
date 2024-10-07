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

class RegisterController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void register() async{
    if(!formKey.currentState!.validate()) return;
    bool isSuccess=false;
    EasyLoading.show(status: 'Opening Account...',dismissOnTap: false,maskType: EasyLoadingMaskType.black);
    try{
      NetworkResponse response = await NetworkCaller.postRequest(
        url: Urls.register,
        body: {
          'name': nameController.text.trim(),
          'email': emailController.text.trim(),
          'password': passwordController.text.trim(),
        },
      );
      if(response.isSuccess){
        isSuccess=true;
        UserController.updateUser(User.fromJson(response.responseData));
        AuthController.setToken(response.responseData['token']);
      }else{
        EasyLoading.showToast(response.errorMessage??'Failed',toastPosition: EasyLoadingToastPosition.bottom,);
      }
    }catch(error){
      EasyLoading.showToast('Failed!',toastPosition: EasyLoadingToastPosition.bottom,);
      log(error.toString());
    }finally{
      EasyLoading.dismiss();
    }
    if(isSuccess){
      emailController.clear();
      passwordController.clear();
      Get.offAll(() => const HomeScreen());
    }
  }


  bool nameFocus = false;
  void nameIconActive(bool value) {
    nameFocus = value;
    update();
  }
  bool passFocus = false;
  void passIconActive(bool value) {
    passFocus = value;
    update();
  }
  bool passFocus2 = false;
  void passIconActive2(bool value) {
    passFocus2 = value;
    update();
  }

  bool emailFocus = false;
  void emailIconActive(bool value) {
    emailFocus = value;
    update();
  }



  confirmPasswordValidation(String? value) {
    if(value == null || value.trim().isEmpty) {
      return 'Provide a password';
    }else if(passwordController.text.trim()!= confirmPasswordController.text.trim()){
      return 'Passwords do not match';
    }else if(value.trim().length < 6){
      return 'minimum 6 characters';
    }
    return null;
  }
}