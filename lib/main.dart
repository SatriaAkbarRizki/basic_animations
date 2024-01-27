import 'package:basic_animations/page/home.dart';
import 'package:basic_animations/page/page_animation/animation_implicit.dart';
import 'package:basic_animations/page/page_animation/custom_d_implicit.dart';
import 'package:basic_animations/page/page_animation/custom_explicit/animatebuilder.dart';
import 'package:basic_animations/page/page_animation/custom_explicit/animatewidget.dart';
import 'package:basic_animations/page/page_animation/custom_s_implicit.dart';
import 'package:basic_animations/page/page_animation/explicit/animation_explicit.dart';
import 'package:basic_animations/page/page_animation/myanimation.dart';
import 'package:basic_animations/page/page_animation/staggered_animation/staggered.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        ImplicitPage.routeName: (context) => const ImplicitPage(),
        CustomStaticImplicit.routeName: (_) => const CustomStaticImplicit(),
        CustomDynamicImplicit.routeName: (_) => const CustomDynamicImplicit(),
        MyAnimation.routeName: (_) => const MyAnimation(),
        ExplicitAnimation.routeName: (_) => const ExplicitAnimation(),
        MyAnimationBuilder.routeName: (_) => const MyAnimationBuilder(),
        MyAnimatedWidget.routeName: (_) => const MyAnimatedWidget(),
        StaggeredHome.routeName: (_) => const StaggeredHome()
      },
      home: Home(),
    );
  }
}
