import 'package:flutter/material.dart';

import '../../../widget/BeamClipper.dart';

class MyAnimatedWidget extends StatefulWidget {
  static String routeName = '/animatewidget';
  const MyAnimatedWidget({super.key});

  @override
  State<MyAnimatedWidget> createState() => _MyAnimatedWidgetState();
}

class _MyAnimatedWidgetState extends State<MyAnimatedWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(duration: const Duration(seconds: 5), vsync: this)
          ..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData.dark(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Animated Widget'),
          ),
          body: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              BeamTransition(animation: _animationController),
              Padding(
                padding: const EdgeInsets.all(50),
                child: Image.asset(
                  'assets/ufo.png',
                ),
              )
            ],
          ),
        ));
  }
}

class BeamTransition extends AnimatedWidget {
  final Animation animation;
  const BeamTransition({super.key, required this.animation})
      : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BeamClipper(),
      child: Container(
        height: 1000,
        decoration: BoxDecoration(
            gradient: RadialGradient(
                radius: 1.5,
                colors: const [Colors.yellow, Colors.transparent],
                stops: [0, animation.value])),
      ),
    );
  }
}
