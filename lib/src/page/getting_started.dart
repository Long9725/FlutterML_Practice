import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

class GettingStartedPage extends StatefulWidget {
  const GettingStartedPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<GettingStartedPage> createState() => _GettingStartedPageState();
}

class _GettingStartedPageState extends State<GettingStartedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[Row(
            children: <Widget>[
              Lottie.asset('assets/lotties/getting-started-coch.json'),
              Lottie.asset('assets/lotties/getting-started-lifestyle.json'),
              Lottie.asset('assets/lotties/getting-started-treadmill.json'),
            ]
        ),
      ]),
    );
  }
}
