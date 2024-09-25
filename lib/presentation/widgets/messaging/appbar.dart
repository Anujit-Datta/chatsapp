import 'package:chatsapp/presentation/utils/constants.dart';
import 'package:chatsapp/presentation/widgets/audio_call_button.dart';
import 'package:chatsapp/presentation/widgets/messaging/avater.dart';
import 'package:chatsapp/presentation/widgets/video_call_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../options_button.dart';

AppBar appbar(context) {
  return AppBar(
    titleSpacing: 10,
    automaticallyImplyLeading: false,
    title: Row(
      children: [
        GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.5,
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Avatar(image: dummyImage),
            title: Text(
              'John Doe',
              style: Theme.of(context).textTheme.displayLarge,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              'last seen yesterday at 10:30 PM',
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
        )
      ],
    ),
    actions: const [
      VideoCallButton(),
      AudioCallButton(),
      OptionsButton(),
    ],
  );
}
