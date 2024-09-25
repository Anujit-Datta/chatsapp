import 'package:flutter/material.dart';

import '../camera_button.dart';
import '../options_button.dart';
import '../search_button.dart';

AppBar appbar() {
  return AppBar(
    titleSpacing: 12,
    title: const Text(
      'ChatsApp',
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 25,
      ),
    ),
    actions: const [
      CameraButton(),
      SearchButton(),
      OptionsButton(),
    ],
  );
}



