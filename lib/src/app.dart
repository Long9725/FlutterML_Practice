import 'package:flutter/material.dart';

import 'package:practice1/src/page/getting_started.dart';
import './page/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const GettingStartedPage(title: 'Flutter Demo Home Page'),
    );
  }
}