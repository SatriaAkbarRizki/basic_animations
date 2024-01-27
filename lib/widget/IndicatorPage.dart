import 'package:flutter/material.dart';

class IndicatorPage extends StatelessWidget {
  final int position, lenghtList;
  const IndicatorPage(
      {super.key, required this.position, required this.lenghtList});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: indicatorPage(position, lenghtList),
    );
  }

  List<Widget> indicatorPage(int indexPage, int length) {
    return List<Widget>.generate(
        length,
        (index) => Container(
              margin: const EdgeInsets.all(3),
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                  color: indexPage == index ? Colors.black : Colors.black26,
                  shape: BoxShape.circle),
            ));
  }
}
