import 'package:flutter/material.dart';

class TimeStopper extends StatelessWidget {
  final AnimationController controller;
  const TimeStopper({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (controller.isAnimating) {
          controller.stop();
        } else {
          controller.repeat();
        }
      },
      onDoubleTap: () {
        if (controller.isAnimating) {
          controller.reverse();
        } else {
          controller.repeat();
        }
      },
    );
  }
}
