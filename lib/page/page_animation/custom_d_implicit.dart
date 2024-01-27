import 'package:flutter/material.dart';

class CustomDynamicImplicit extends StatefulWidget {
  static String routeName = '/customsdynamicimplicit';
  const CustomDynamicImplicit({super.key});

  @override
  State<CustomDynamicImplicit> createState() => _CustomDynamicImplicitState();
}

class _CustomDynamicImplicitState extends State<CustomDynamicImplicit> {
  Color _newColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Custom Dynamic Implicit Animation',
          ),
        ),
        body: Center(
          child: TweenAnimationBuilder(
            tween: ColorTween(begin: Colors.white, end: _newColor),
            duration: const Duration(seconds: 3),
            child: Image.asset('assets/sun.png'),
            onEnd: () => setState(() {
              _newColor = _newColor == Colors.red ? Colors.white : Colors.red;
            }),
            builder: (_, color, child) => ColorFiltered(
              colorFilter: ColorFilter.mode(color!, BlendMode.modulate),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
