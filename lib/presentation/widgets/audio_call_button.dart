import 'package:flutter/material.dart';

class AudioCallButton extends StatelessWidget {
  const AudioCallButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.call_outlined),
      onPressed: () {},
    );
  }
}
