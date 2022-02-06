import 'package:flutter/material.dart';
import 'package:practice1/src/service/auth.dart';

class ResultPage extends StatefulWidget {
  @override
  State<ResultPage> createState() => ResultPageState();
}

class ResultPageState extends State<ResultPage> {
  AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(_auth.getUser()?.uid ?? "none"),
          Text(_auth.getUser()?.phoneNumber ?? "None")
        ],
      ),
    );
  }
}
