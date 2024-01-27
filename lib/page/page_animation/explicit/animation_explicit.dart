import 'package:basic_animations/widget/time_stopper.dart';
import 'package:flutter/material.dart';

class ExplicitAnimation extends StatefulWidget {
  static String routeName = '/ExplicitAnimation';
  const ExplicitAnimation({super.key});

  @override
  State<ExplicitAnimation> createState() => _ExplicitAnimationState();
}

class _ExplicitAnimationState extends State<ExplicitAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(duration: const Duration(seconds: 15), vsync: this)
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
          title: const Text('Explicit Animations'),
        ),
        body: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: RotationTransition(
                  alignment: Alignment.center,
                  turns: _animationController,
                  child: Image.asset('assets/galaxyspiral.png')),
            ),
            TimeStopper(controller: _animationController),
            const Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'Click anywere for stop and repeat animation and double click for reverse and repeat animation',
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
