import 'package:basic_animations/model/imagemodel.dart';
import 'package:basic_animations/widget/AnimationImage.dart';
import 'package:basic_animations/widget/IndicatorPage.dart';
import 'package:flutter/material.dart';

class MyAnimation extends StatefulWidget {
  static String routeName = '/myanimation';
  const MyAnimation({super.key});

  @override
  State<MyAnimation> createState() => _MyAnimationState();
}

class _MyAnimationState extends State<MyAnimation> {
  int activePage = 0;

  final PageController _pageController = PageController();

  final List<ImageModel> listImage = [
    ImageModel(name: 'Architecture', asset: 'assets/images/architecture.jpg'),
    ImageModel(name: 'City', asset: 'assets/images/city.jpg'),
    ImageModel(name: 'Penguin', asset: 'assets/images/penguin.jpg'),
    ImageModel(name: 'Sea', asset: 'assets/images/sea.jpg')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Animations'),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: listImage.length,
              scrollDirection: Axis.horizontal,
              onPageChanged: (value) => setState(() {
                activePage = value;
              }),
              itemBuilder: (context, position) {
                bool active = position == activePage;
                return AnimationImage(
                    name: listImage[position].name,
                    image: listImage[position].asset,
                    position: active);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: IndicatorPage(
                position: activePage, lenghtList: listImage.length),
          )
        ],
      ),
    );
  }
}
