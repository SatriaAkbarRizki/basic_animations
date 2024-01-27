import 'package:basic_animations/model/navigator_model.dart';
import 'package:basic_animations/page/page_animation/animation_implicit.dart';
import 'package:basic_animations/page/page_animation/custom_d_implicit.dart';
import 'package:basic_animations/page/page_animation/custom_explicit/animatebuilder.dart';
import 'package:basic_animations/page/page_animation/custom_explicit/animatewidget.dart';
import 'package:basic_animations/page/page_animation/custom_s_implicit.dart';
import 'package:basic_animations/page/page_animation/myanimation.dart';
import 'package:flutter/material.dart';

import 'page_animation/explicit/animation_explicit.dart';
import 'page_animation/staggered_animation/staggered.dart';

class Home extends StatelessWidget {
  final List<NavigatorModel> _navigate = [
    NavigatorModel(name: 'Implicit Animation', page: ImplicitPage.routeName),
    NavigatorModel(
        name: 'Custom Static implicit animation',
        page: CustomStaticImplicit.routeName),
    NavigatorModel(
        name: 'Custom dynamic implicit animation',
        page: CustomDynamicImplicit.routeName),
    NavigatorModel(
        name: 'Explicit Animation', page: ExplicitAnimation.routeName),
    NavigatorModel(name: 'My Animation', page: MyAnimation.routeName),
    NavigatorModel(name: 'Animate Builder', page: MyAnimationBuilder.routeName),
    NavigatorModel(name: 'Animate Widget', page: MyAnimatedWidget.routeName),
    NavigatorModel(name: 'Staggered  Animations', page: StaggeredHome.routeName)
  ];

  Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Basic Animations Flutter!')),
      body: Center(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: _navigate.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, _navigate[index].page);
                    },
                    child: Text(_navigate[index].name)),
                const SizedBox(
                  height: 10,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
