import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:practice1/src/provider/firebase_auth.dart';


class ResultPage extends StatefulWidget {
  @override
  State<ResultPage> createState() => ResultPageState();
}

class ResultPageState extends State<ResultPage> {

  @override
  Widget build(BuildContext context) {
    final _auth = Provider.of<FirebaseAuthProvider>(context);
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
