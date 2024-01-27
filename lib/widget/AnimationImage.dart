import 'package:flutter/material.dart';

class AnimationImage extends StatelessWidget {
  final String name;
  final String image;
  final bool position;
  const AnimationImage(
      {super.key,
      required this.name,
      required this.image,
      required this.position});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 30, end: position ? 20 : 40),
      duration: const Duration(milliseconds: 500),
      builder: (context, value, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              curve: Curves.fastOutSlowIn,
              opacity: position ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 1000),
              child: Text(name,
                  style: const TextStyle(
                    fontSize: 18,
                  )),
            ),
            AnimatedContainer(
              margin: EdgeInsets.only(
                  left: value, right: value, top: 20, bottom: value),
              curve: Curves.easeInOutQuint,
              decoration:
                  const BoxDecoration(boxShadow: [BoxShadow(blurRadius: 10)]),
              duration: const Duration(milliseconds: 500),
              child: Image.asset(image),
            ),
          ],
        );
      },
    );
  }
}
