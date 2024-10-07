import 'package:get/get.dart';

class HintController extends GetxController {
  List<bool> hints = [false,false,false,false];
  List<bool> passwordHint(String value) {
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      hints[1]=true;
    } else{
      hints[1]=false;
    }
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      hints[2]=true;
    } else{
      hints[2]=false;
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      hints[3]=true;
    } else{
      hints[3]=false;
    }
    if (!RegExp(r'''[!@#\$%\^&\*\(\)_\+\-=\{\}\[\]\|:;\"\'<>,\.\?\/~`]''').hasMatch(value)) {
      hints[0]=true;
    }else{
      hints[0]=false;
    }
    update();
    return hints;
  }
}