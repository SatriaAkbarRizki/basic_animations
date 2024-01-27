import 'package:basic_animations/page/page_animation/staggered_animation/staggeredanim.dart';
import 'package:flutter/material.dart';

class StaggeredHome extends StatefulWidget {
  static String routeName = '/staggered';
  const StaggeredHome({super.key});

  @override
  State<StaggeredHome> createState() => _StaggeredHomeState();
}

class _StaggeredHomeState extends State<StaggeredHome>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this)
          ..repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Staggerd Animations'),
      ),
      body: Center(
        child: Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              border: Border.all(color: Colors.black.withOpacity(0.5))),
          child: StaggeredAnimation(controller: _controller),
        ),
      ),
    );
  }
}
