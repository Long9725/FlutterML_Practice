import 'package:flutter/material.dart';
import 'package:practice1/src/page/animation/container.dart';
import 'package:practice1/src/page/animation/cross_fade.dart';
import 'package:practice1/src/page/animation/size.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Home")));
  }
}
