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

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  bool _toggle = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 1))
        .then((value) => setState(() {
              _toggle = !_toggle;
            }))
        .then((value) => Future.delayed(const Duration(seconds: 5))
            .then((value) => Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (context) => const GettingStartedPage(
                          title: '',
                        )),
                (route) => false)));
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
                    duration: const Duration(seconds: 1))
              ],
            ))));
  }
}
