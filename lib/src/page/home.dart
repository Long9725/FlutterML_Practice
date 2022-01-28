import 'package:flutter/material.dart';
import 'package:practice1/src/helper.dart';

import 'package:practice1/src/service/auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _phoneNumberEditingController =
      TextEditingController();
  final TextEditingController _smsCodeEditingController =
      TextEditingController();
  final AuthService _auth = AuthService();
  bool _isVerification = false;

  @override
  void dispose() {
    super.dispose();

    _phoneNumberEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  decoration: const InputDecoration(
                      hintText: "전화번호를 입력해주세요(- 제외)",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black))),
                  controller: _phoneNumberEditingController,
                ),
                const SizedBox(
                  height: kDefaultPadding * 2,
                ),
                TextButton(
                    onPressed: () async {
                      await _auth.verifyPhoneNumber(
                          _phoneNumberEditingController.text);
                    },
                    child: Text("Home")),
                TextField(
                  decoration: const InputDecoration(
                      hintText: "코드를 입력해주세요",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black))),
                  controller: _smsCodeEditingController,
                ),
                const SizedBox(
                  height: kDefaultPadding * 2,
                ),
                TextButton(
                    onPressed: () async {
                      await _auth.signInWithPhoneNumber(
                          _auth.getVerificationId(),
                          _smsCodeEditingController.text);
                      setState(() {
                        _isVerification = true;
                      });
                    },
                    child: Text("Login")),
                Visibility(
                    visible: _isVerification,
                    child: Column(
                      children: [
                        Text(_auth.getUser()?.phoneNumber ??
                            "phone number error"),
                        Text(_auth.getUser()?.uid ?? "uid error")
                      ],
                    ))
              ],
            )));
  }
}
