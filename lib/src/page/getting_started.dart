import 'dart:async';

import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

import 'package:practice1/src/helper.dart';
import 'package:practice1/src/model/slide.dart';

import 'home.dart';

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
    final height = MediaQuery.of(context).size.height - kDefaultPadding * 2;
    final pageViewHeight = 290;
    final gettingStartedHeight = 96.0;
    final paddingSlideDots =
        (height - (gettingStartedHeight + pageViewHeight)) / 4;

    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                    child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    PageView.builder(
                        scrollDirection: Axis.horizontal,
                        controller: _pageController,
                        onPageChanged: _onPageChanged,
                        itemCount: slideList.length,
                        itemBuilder: (context, index) => SlideItem(index)),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      for (int i = 0; i < slideList.length; i++)
                        if (i == _currentPage)
                          SlideDots(true)
                        else
                          SlideDots(false)
                    ])
                  ],
                )),
                SizedBox(
                  height: paddingSlideDots,
                ),
                OutlinedButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).primaryColor),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomePage(title: ""))
                      );
                    },
                    child: Text("시작하기")),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("이미 계정이 있으신가요?"),
                    TextButton(onPressed: () {}, child: Text("로그인"))
                  ],
                )
              ],
            )));
  }

  Widget SlideItem(int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 200,
          width: 200,
          child: Lottie.asset(slideList[index].imageUrl),
        ),
        const SizedBox(height: kDefaultPadding * 2),
        Text("안녕하세요",
            style: TextStyle(
              fontSize: 22,
              color: Theme.of(context).primaryColor,
            )),
        const SizedBox(height: kDefaultPadding),
        Text(
          "2022 DoiT! Flutter를 연습하는 중입니다",
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget SlideDots(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: isActive ? 12 : 8,
      width: isActive ? 12 : 8,
      decoration: BoxDecoration(
          color: isActive ? Theme.of(context).primaryColor : Colors.grey,
          borderRadius: const BorderRadius.all(Radius.circular(12))),
    );
  }
}
