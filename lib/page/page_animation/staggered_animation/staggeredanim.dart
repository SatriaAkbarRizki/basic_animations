import 'package:flutter/material.dart';

class StaggeredAnimation extends StatefulWidget {
  final Animation<double> controller;

  const StaggeredAnimation({super.key, required this.controller});

  @override
  State<StaggeredAnimation> createState() => _StaggeredAnimationState();
}

class _StaggeredAnimationState extends State<StaggeredAnimation> {
  Animation<double> get control => widget.controller;
  late Animation<double> opacity;

  late final Animation<double> width;

  late final Animation<double> height;

  late final Animation<EdgeInsets> padding;

  late final Animation<BorderRadius?> borderRadius;

  late final Animation<Color?> color;

  @override
  void initState() {
    initiliaze();
    super.initState();
  }

  void initiliaze() {
    // The curve is time animation first and last

    opacity = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: control,
        curve: const Interval(0.0, 0.100, curve: Curves.ease)));

    // this begin is width first and end is width last
    width = Tween(begin: 50.0, end: 150.0).animate(CurvedAnimation(
        parent: control,
        curve: const Interval(0.125, 0.250, curve: Curves.ease)));

    // this begin is height first and end is height last
    height = Tween(begin: 50.0, end: 150.0).animate(CurvedAnimation(
        parent: control,
        curve: const Interval(0.250, 0.375, curve: Curves.ease)));

    padding = EdgeInsetsTween(
            begin: const EdgeInsets.only(bottom: 10),
            end: const EdgeInsets.only(bottom: 75))
        .animate(CurvedAnimation(parent: control, curve: Curves.ease));

    borderRadius = BorderRadiusTween(
            begin: BorderRadius.circular(4), end: BorderRadius.circular(75))
        .animate(CurvedAnimation(parent: control, curve: Curves.ease));

    color = ColorTween(begin: Colors.orange[400], end: Colors.orange[400])
        .animate(CurvedAnimation(parent: control, curve: Curves.ease));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: control,
      builder: (context, child) => Container(
        padding: padding.value,
        alignment: Alignment.bottomCenter,
        child: Opacity(
          opacity: opacity.value,
          child: Container(
            height: height.value,
            width: width.value,
            decoration: BoxDecoration(
                color: color.value, borderRadius: borderRadius.value),
          ),
        ),
      ),
    );
  }
}
