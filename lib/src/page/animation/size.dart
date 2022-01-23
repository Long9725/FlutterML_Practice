import 'package:flutter/material.dart';

class AnimationSizePage extends StatefulWidget {
  @override
  State<AnimationSizePage> createState() => AnimationSizePageState();
}

class AnimationSizePageState extends State<AnimationSizePage> {
  bool _toggle = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedSize(
            duration: const Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
            child: Container(
              height: _toggle ? 100 : 200,
              width: _toggle ? 200 : 100,
              color: _toggle ? Colors.red : Colors.blue,
            )),
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
