import 'package:flutter/material.dart';

class CrossButton extends StatelessWidget {
  const CrossButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.close),
      onPressed: () {},
    );
  }
}
