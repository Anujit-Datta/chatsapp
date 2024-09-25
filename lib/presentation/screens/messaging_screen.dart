import 'package:chatsapp/presentation/utils/app_colors.dart';
import 'package:chatsapp/presentation/widgets/camera_button.dart';
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
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.emoji_emotions_outlined,
                              color: Colors.white24,
                            ),
                          ),
                          const Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Type a message',
                                hintStyle: TextStyle(
                                  color: Colors.white24,
                                ),
                                border: InputBorder.none,
                              ),
                              maxLines: 10,
                              minLines: 1,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.attach_file,
                              color: Colors.white24,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.white24,
                            ),
                          ),
                        ],
                      ),
                    ),
                ),
                CircleAvatar(
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
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
