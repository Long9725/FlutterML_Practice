import 'package:flutter/material.dart';
import 'package:practice1/src/page/animation/container.dart';
import 'package:practice1/src/page/animation/cross_fade.dart';
import 'package:practice1/src/page/animation/size.dart';

class AnimationHomePage extends StatefulWidget {
  const AnimationHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<AnimationHomePage> createState() => _AnimationHomePageState();
}

class _AnimationHomePageState extends State<AnimationHomePage> {
  final pageList = {
    'size': AnimationSizePage(),
    'cross_fade': AnimationCrossFadePage(),
    'container': AnimationContainerPage()
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.builder(
            itemCount: pageList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1 / 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (BuildContext context, int index) {
              return OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            pageList.values.elementAt(index)));
                  },
                  child: Text(pageList.keys.elementAt(index)));
            }));
  }
}
