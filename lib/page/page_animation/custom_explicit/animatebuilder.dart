import 'package:basic_animations/widget/BeamClipper.dart';
import 'package:flutter/material.dart';

class MyAnimationBuilder extends StatefulWidget {
  static String routeName = '/animationbuilder';
  const MyAnimationBuilder({super.key});

  @override
  State<MyAnimationBuilder> createState() => _MyAnimationBuilderState();
}

class _MyAnimationBuilderState extends State<MyAnimationBuilder>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(duration: const Duration(seconds: 3), vsync: this)
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
            title: const Text('Animations Builder'),
          ),
          body: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) => ClipPath(
                  clipper: BeamClipper(),
                  child: Container(
                    height: 1000,
                    decoration: BoxDecoration(
                        gradient: RadialGradient(
                            radius: 1.5,
                            colors: const [Colors.yellow, Colors.transparent],
                            stops: [0, _animationController.value])),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(50),
                child: Image.asset(
                  'assets/ufo.png',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                      onPressed: () {
                        if (_animationController.isAnimating) {
                          _animationController.reverse();
                        } else {
                          _animationController.repeat();
                        }
                      },
                      icon: Icon(Icons.repeat)),
                ),
              )
            ],
          ),
        ));
  }
}
