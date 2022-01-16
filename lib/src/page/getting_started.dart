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
      body: Container(
        child: Lottie.asset('assets/lotties/getting-started-coch.json'),
      ),
    );
  }
}
