import 'package:flutter/material.dart';

AppBar appbar() {
  return AppBar(
    titleSpacing: 8,
    title: const Text(
      'ChatsApp',
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 25,
      ),
    ),
    actions: [
      IconButton(
        icon: const Icon(Icons.camera_alt_outlined),
        onPressed: () {},
      ),
      IconButton(
        icon: const Icon(Icons.search),
        onPressed: () {},
      ),
      IconButton(
        icon: const Icon(Icons.more_vert),
        onPressed: () {},
      ),
    ],
  );
}
