import 'dart:async';

import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

import 'package:practice1/src/model/slide.dart';

class GettingStartedPage extends StatefulWidget {
  const GettingStartedPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<GettingStartedPage> createState() => _GettingStartedPageState();
}

class _GettingStartedPageState extends State<GettingStartedPage> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: _pageController,
            onPageChanged: _onPageChanged,
            itemCount: slideList.length,
            itemBuilder: (context, index) => SlideItem(index)));
  }

  Widget SlideItem(int index) {
    return Column(
      children: <Widget>[
        Container(
          height: 200,
          width: 200,
          child: Lottie.asset(slideList[index].imageUrl),
        ),
        const SizedBox(height: 40),
        Text("안녕하세요",
            style: TextStyle(
              fontSize: 22,
              color: Theme.of(context).primaryColor,
            )),
        const SizedBox(height: 10),
        Text(
          "2022 DoiT! Flutter를 연습하는 중입니다",
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
