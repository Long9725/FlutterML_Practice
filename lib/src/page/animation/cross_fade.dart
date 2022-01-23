import 'package:flutter/material.dart';

class AnimationCrossFadePage extends StatefulWidget {
  @override
  State<AnimationCrossFadePage> createState() => AnimationCrossFadePageState();
}

class AnimationCrossFadePageState extends State<AnimationCrossFadePage> {
  bool _toggle = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedCrossFade(
          firstCurve: Curves.fastOutSlowIn,
          // the same curve as above
          crossFadeState:
              !_toggle ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          duration: const Duration(milliseconds: 1000),
          // the same duration as above
          firstChild: Text(
            "H",
            style: TextStyle(
              fontSize: 40,
            ),
          ),
          // an empty container
          secondChild: Text(
            "Hello World",
            style: TextStyle(
              fontSize: 40,
            ),
          ),
          // a Row containing rest of our logo
          alignment: Alignment.centerLeft,
          // "reveal" the logo from the center left
          sizeCurve: Curves.easeInOut,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _toggle = !_toggle;
          });
        },
      ),
    );
  }
}
