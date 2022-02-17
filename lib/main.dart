import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import './src/app.dart';

late Directory tempDir;
late List<CameraDescription> cameras;

String get tempPath => '${tempDir.path}/doitlogo-removebg.jpg';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  cameras = await availableCameras();
  runApp(const MyApp());
  getTemporaryDirectory().then((dir) => tempDir = dir);
}
