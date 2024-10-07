
import 'package:chatsapp/presentation/controllers/password_hint_controller.dart';
import 'package:get/get.dart';

emailValidation(String? value) {
  if(value == null || value.trim().isEmpty) {
    return 'Provide an email address';
  }else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value.trim())){
    return 'Invalid email format';
  }
  return null;
}

passwordValidation(String? value) {
  if(value == null || value.trim().isEmpty) {
    return 'Provide a password';
  }else if(!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$&*~]).*$').hasMatch(value.trim())){
    return 'weak password';
  }else if(value.trim().length < 6){
    return 'minimum 6 characters';
  }
  return null;
}




List<String> ABC= ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'];
List<String> abc= ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'];
List<String> numbers= ['0','1','2','3','4','5','6','7','8','9'];
List<String> specialCharacters= ['!','@','#','%','^','&','*','(',')','_','+','-','=','{','}','[',']','|',':',';','"',',','.','<','>','/','?','~','`'];