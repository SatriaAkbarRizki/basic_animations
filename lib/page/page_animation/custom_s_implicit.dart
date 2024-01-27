import 'package:flutter/material.dart';

class CustomStaticImplicit extends StatefulWidget {
  static String routeName = '/customstaticimplicit';
  const CustomStaticImplicit({super.key});

  @override
  State<CustomStaticImplicit> createState() => _CustomStaticImplicitState();
}

class _CustomStaticImplicitState extends State<CustomStaticImplicit> {
  double _value = .4;
  Color _newColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Custom Static Implicit Animation',
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TweenAnimationBuilder(
              tween: ColorTween(begin: Colors.white, end: _newColor),
              duration: const Duration(seconds: 2),
              builder: (_, color, child) => ColorFiltered(
                  colorFilter: ColorFilter.mode(color!, BlendMode.modulate),
                  child: Image.asset('assets/sun.png')),
            ),
            Slider.adaptive(
              min: 0,
              value: _value,
              onChanged: (value) {
                setState(() {
                  _value = value;
                  _newColor = Color.lerp(Colors.white, Colors.red, value)!;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
