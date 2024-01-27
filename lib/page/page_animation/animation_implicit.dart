import 'package:flutter/material.dart';

class ImplicitPage extends StatefulWidget {
  static String routeName = '/Home';

  const ImplicitPage({super.key});

  @override
  State<ImplicitPage> createState() => _ImplicitPageState();
}

class _ImplicitPageState extends State<ImplicitPage> {
  bool isZoom = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Implicit Animation Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              curve: isZoom ? Curves.ease : Curves.easeInOutQuint,
              duration: const Duration(seconds: 1),
              width: isZoom ? 300 : 150,
              child: Image.asset('assets/star.png'),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    isZoom = !isZoom;
                  });
                },
                child: const Text('Zoom in/out'))
          ],
        ),
      ),
    );
  }
}
