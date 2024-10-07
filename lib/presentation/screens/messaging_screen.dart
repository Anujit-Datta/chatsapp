import 'package:chatsapp/presentation/utils/app_colors.dart';
import 'package:chatsapp/presentation/widgets/messaging/appbar.dart';
import 'package:chatsapp/presentation/widgets/messaging/background.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/messages_controller.dart';
import '../controllers/user_controller.dart';

class MessagingScreen extends StatelessWidget {
  const MessagingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context),
      body: Background(
        child: Column(
          children: [
            const MessagesSection(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width - 50,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    decoration: BoxDecoration(
                      color: AppColors.messageBG,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const EmojiButton(),
                        messageInputField(),
                        const AttachmentButton(),
                        const CameraButton(),
                      ],
                    ),
                  ),
                ),
                sendButton(),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget messageInputField() {
    return const Expanded(
      child: TextField(
        decoration: InputDecoration(
          focusColor: Colors.white,
          hintText: 'Message',
          hintStyle: TextStyle(color: Colors.white24, fontSize: 16),
          border: InputBorder.none,
        ),
        maxLines: 10,
        minLines: 1,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  CircleAvatar sendButton() {
    return CircleAvatar(
      backgroundColor: AppColors.primary,
      radius: 23,
      child: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.send,
          color: Colors.black,
          size: 22,
        ),
      ),
    );
  }
}

class MessagesSection extends StatefulWidget {
  const MessagesSection({
    super.key,
  });

  @override
  State<MessagesSection> createState() => _MessagesSectionState();
}

class _MessagesSectionState extends State<MessagesSection> {
  @override
  void initState() {
    super.initState();
    Get.find<MessagesController>().loadMessages(
      chatId: 'b0b6f02b-cfb7-48b8-976f-392e6ecae116',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 4, right: 4, top: 12, bottom: 8),
        child: GetBuilder<MessagesController>(builder: (ctrl) {
          return ListView.separated(
            itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment:
                    ctrl.messageHolder.messages[index].senderUserId! ==
                            UserController.currentUser.userId
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: ctrl.messageHolder.messages[index].senderUserId! ==
                              UserController.currentUser.userId
                          ? AppColors.accent
                          : AppColors.messageBG,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      ctrl.messageHolder.messages[index].content ?? '',
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 1),
            itemCount: ctrl.messageHolder.messages.length,
            reverse: true,
          );
        }),
      ),
    );
  }

  @override
  dispose() {
    Get.find<MessagesController>().stopLoadingMessages();
    super.dispose();
  }
}

class CameraButton extends StatelessWidget {
  const CameraButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: const Icon(
        Icons.camera_alt_outlined,
        color: Colors.white24,
      ),
    );
  }
}

class AttachmentButton extends StatelessWidget {
  const AttachmentButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: const Icon(
        Icons.attach_file,
        color: Colors.white24,
      ),
    );
  }
}

class EmojiButton extends StatelessWidget {
  const EmojiButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: const Icon(
        Icons.emoji_emotions_outlined,
        color: Colors.white24,
      ),
    );
  }
}
