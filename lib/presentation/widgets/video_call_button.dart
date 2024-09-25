import 'package:flutter/material.dart';

class VideoCallButton extends StatelessWidget {
  const VideoCallButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.videocam_outlined,size: 28,),
      onPressed: () {},
    );
  }
}
