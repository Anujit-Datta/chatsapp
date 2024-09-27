import 'package:chatsapp/presentation/controllers/home_controller.dart';
import 'package:chatsapp/presentation/controllers/login_controller.dart';
import 'package:get/get.dart';

class ControllerBinders extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(LoginController());
  }
}