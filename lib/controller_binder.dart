import 'package:chatsapp/presentation/controllers/chats_list_controller.dart';
import 'package:chatsapp/presentation/controllers/home_controller.dart';
import 'package:chatsapp/presentation/controllers/login_controller.dart';
import 'package:chatsapp/presentation/controllers/messages_controller.dart';
import 'package:chatsapp/presentation/controllers/password_hint_controller.dart';
import 'package:chatsapp/presentation/controllers/register_controller.dart';
import 'package:get/get.dart';

class ControllerBinders extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(LoginController());
    Get.put(RegisterController());
    Get.put(HintController());
    Get.put(ChatsListController());
    Get.put(MessagesController());
  }
}