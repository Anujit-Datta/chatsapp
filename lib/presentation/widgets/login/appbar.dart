import 'package:chatsapp/presentation/widgets/login/cross_button.dart';
import 'package:flutter/material.dart';
import '../camera_button.dart';
import '../options_button.dart';
import '../search_button.dart';

AppBar appbar() {
  return AppBar(
    automaticallyImplyLeading: false,
    centerTitle: true,
    title: const Text(
      'Login',
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 25,
      ),
    ),
    actions: const [
      OptionsButton(),
    ],
  );
}



