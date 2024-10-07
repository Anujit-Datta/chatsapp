import 'dart:convert';
import 'dart:developer';
import 'package:chatsapp/data/middlewares/user_auth_controller.dart';
import 'package:chatsapp/presentation/utils/constants.dart';
// import 'package:get/get.dart' as getx;
import 'package:http/http.dart';

import '../models/network_reponse.dart';

class NetworkCaller{
  static Future<NetworkResponse> getRequest({required String url})async{
    try{
      log(url);
      final Response response = await get(Uri.parse(url),headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $tokenAbcd3',
      });
      log(response.statusCode.toString());
      log(response.body);
      final decodedResponse=jsonDecode(response.body);
      if(response.statusCode==200){
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          responseData: decodedResponse['data'],
        );
      }else if(response.statusCode==401){
        goToSignInScreen();
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMessage: decodedResponse["message"],
        );
      }else{
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMessage: decodedResponse["message"],
        );
      }
    }catch(error){
      log(error.toString());
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMessage: error.toString(),
      );
    }
  }

  static Future<NetworkResponse> postRequest({required String url,required Map<String,dynamic> body})async{
    log(url);
    log(body.toString());
    try{
      Map<String,String> header = <String,String>{
        'Content-Type':'application/json'
      };
      // if(await AuthController.isLoggedIn()){
      //   header['token']=AuthController.accessToken;
      // }
      final Response response = await post(
        Uri.parse(url),
        headers: header,
        body: jsonEncode(body),
      );
      log(response.statusCode.toString());
      log(response.body);
      final decodedResponse=jsonDecode(response.body);
      if(response.statusCode==200){
        log(decodedResponse['data'].toString());
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          responseData: decodedResponse['data'],
        );
      }else if(response.statusCode==401){
        goToSignInScreen();
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMessage: decodedResponse["message"],
        );
      }else{
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMessage: decodedResponse["message"],
        );
      }
    }catch(error){
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMessage: error.toString(),
      );
    }
  }

  static void goToSignInScreen()async{
    AuthController.deleteData();
    //getx.Get.to(()=>const EmailVerifyScreen());
  }
}