import 'package:chatsapp/data/middlewares/network_caller.dart';
import 'package:chatsapp/data/middlewares/user_auth_controller.dart';
import 'package:chatsapp/data/models/conversation.dart';
import 'package:chatsapp/data/models/network_reponse.dart';
import 'package:chatsapp/data/utils/urls.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../utils/constants.dart';

class ChatsListController extends GetxController {
  bool inProgress = false;
  List<List<Conversation>> conversationList = [[],[],[],[]];

  void loadConversationList() async{
    inProgress=true;
    update();
    AuthController.getToken();

    try{
      NetworkResponse response =
          await NetworkCaller.getRequest(url: Urls.getChats);
      if (response.isSuccess) {
        conversationList[0].clear();
        for (var conversation in response.responseData['rows']) {
          conversationList[0].add(Conversation.fromJson(conversation));
        }
      } else {
        EasyLoading.showToast(response.errorMessage ?? 'Failed');
      }
    }catch(e){
      EasyLoading.showToast(e.toString());
    }finally{
      inProgress=false;
      update();
    }
  }

}