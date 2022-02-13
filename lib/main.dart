import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import './src/app.dart';

late Directory tempDir;

String get tempPath => '${tempDir.path}/doitlogo-removebg.jpg';

void main() {
  runApp(const MyApp());
  getTemporaryDirectory().then((dir) => tempDir = dir);
}
