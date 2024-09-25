import 'package:chatsapp/presentation/utils/app_colors.dart';
import 'package:chatsapp/presentation/widgets/messaging/appbar.dart';
import 'package:chatsapp/presentation/widgets/messaging/background.dart';
import 'package:flutter/material.dart';

class MessagingScreen extends StatelessWidget {
  const MessagingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context),
      body: Background(
        child: Column(
          children: [
            const Expanded(child: Center()),
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
                        const ImojiButton(),
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

  Expanded messageInputField() {
    return const Expanded(
      child: TextField(
        decoration: InputDecoration(
          focusColor: Colors.white,
          hintText: 'Message',
          hintStyle: TextStyle(
            color: Colors.white24,
            fontSize: 16
          ),
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

class ImojiButton extends StatelessWidget {
  const ImojiButton({
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
