import 'package:chatsapp/presentation/controllers/home_controller.dart';
import 'package:get/get.dart';

class ControllerBinders extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}