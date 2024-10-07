import 'dart:async';

import 'package:chatsapp/data/models/messages_wrapper.dart';
import 'package:chatsapp/data/models/network_reponse.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../data/middlewares/network_caller.dart';
import '../../data/utils/urls.dart';

class MessagesController extends GetxController {
  MessagesWrapper messageHolder = MessagesWrapper(messages: []);
  Timer? timer;

  void loadMessages({required String chatId}) async {
    timer = Timer.periodic((const Duration(seconds: 2)), (_) async {
      try {
        NetworkResponse response =
            await NetworkCaller.getRequest(url: Urls.getMessages(chatId));
        if (response.isSuccess) {
          messageHolder = MessagesWrapper.fromJson(response.responseData);
        } else {
          EasyLoading.showToast(response.errorMessage ?? 'Failed');
        }
      } catch (e) {
        EasyLoading.showToast(e.toString());
      } finally {
        update();
      }
    });
  }

  void stopLoadingMessages() {
    timer?.cancel();
  }

  void sendMessage({required String chatId, required String message}) async {
    try {
      NetworkResponse response = await NetworkCaller.postRequest(
        url: Urls.sendMessage,
        body: {
          'chatId': chatId,
          'content': message,
        },
      );
      if (response.isSuccess) {
        messageHolder.messages.add(response.responseData);
      } else {
        EasyLoading.showToast(response.errorMessage ?? 'Failed');
      }
    } catch (e) {
      EasyLoading.showToast(e.toString());
    } finally {
      update();
    }
  }
}
