// import 'package:flutter/material.dart';
// import 'package:practice1/src/helper.dart';
// import 'package:practice1/src/page/getting_started.dart';
//
// class SplashScreen extends StatefulWidget {
//   @override
//   State<SplashScreen> createState() => SplashScreenState();
// }
//
// class SplashScreenState extends State<SplashScreen> {
//   bool _toggle = false;
//
//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(const Duration(seconds: 1))
//         .then((value) => setState(() => _toggle = true))
//         .then((value) => Future.delayed(const Duration(seconds: 3)).then(
//             (value) => Navigator.of(context).pushAndRemoveUntil(
//                 MaterialPageRoute(
//                     builder: (context) => GettingStartedPage(title: "")),
//                 (route) => false)));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: Container(
//         color: kPrimaryColor,
//         child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//           AnimatedDefaultTextStyle(
//             duration: const Duration(milliseconds: 700),
//             curve: Curves.fastOutSlowIn,
//             style: TextStyle(
//                 color: Colors.white,
//                 fontSize: !_toggle ? 178 : 50,
//                 fontWeight: FontWeight.w600),
//             child: const Text("D"),
//           ),
//           AnimatedCrossFade(
//             firstCurve: Curves.fastOutSlowIn,
//             firstChild: Container(),
//             secondChild: Text("oiT!",
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 50,
//                     fontWeight: FontWeight.w600)),
//             crossFadeState:
//                 !_toggle ? CrossFadeState.showFirst : CrossFadeState.showSecond,
//             duration: const Duration(milliseconds: 1000),
//             sizeCurve: Curves.easeInOut,
//             alignment: Alignment.centerLeft,
//           )
//         ]),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:practice1/src/helper.dart';
import 'package:practice1/src/page/getting_started.dart';
import 'package:practice1/src/page/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  bool _toggle = false;
  bool _logoToggle = false;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation = Tween<double>(begin: 1.0, end: 1.2).animate(controller);
    animation.addListener(() {
      setState(() {});
    });

    Future.delayed(const Duration(seconds: 1))
        .then((value) => setState(() {
              _toggle = !_toggle;
            }))
        .then((value) => Future.delayed(const Duration(milliseconds: 1500))
            .then((value) => setState(() {
                  _logoToggle = !_logoToggle;
                }))
            .then((value) => Future.delayed(const Duration(seconds: 2))
                .then((value) => controller.forward())
                .then((value) => Future.delayed(const Duration(milliseconds: 500))
                    .then((value) => Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => HomePage(title: "")),
                        (route) => false)))));
  }

  @override
  void dispose() {
    super.dispose();

    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
            color: kPrimaryColor,
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedDefaultTextStyle(
                    child: Text("D"),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: !_toggle ? 170 : 50,
                        fontWeight: FontWeight.w600),
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastOutSlowIn),
                AnimatedCrossFade(
                    firstChild: Container(),
                    secondChild: Text("oiT!",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: !_toggle ? 170 : 50,
                            fontWeight: FontWeight.w600)),
                    crossFadeState: !_toggle
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    alignment: Alignment.centerLeft,
                    secondCurve: Curves.easeInOut,
                    duration: const Duration(seconds: 1)),
                const SizedBox(
                  height: kDefaultPadding,
                  width: kDefaultPadding,
                ),
                Transform.scale(
                  scale: animation.value,
                  child: AnimatedContainer(
                      duration: const Duration(seconds: 2),
                      height: !_logoToggle ? 0 : 75,
                      width: !_logoToggle ? 0 : 75,
                      child: Image.asset(
                        'assets/images/doitlogo-removebg.png',
                        color: Colors.white,
                      )),
                )
              ],
            ))));
  }
}
