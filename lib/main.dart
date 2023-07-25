// ignore_for_file: prefer_const_constructors

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:window_manager/window_manager.dart';
import 'dart:io' show Platform;

import 'home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  await Window.initialize();
  // if (!kIsWeb) {
  //   if (Platform.isWindows) {
  //     setWindowTitle("Garen GUI 3.0");
  //   }
  // }
  if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
    doWhenWindowReady(() async {
      const initialSize = Size(500, 500);
      appWindow.minSize = initialSize;
      appWindow.size = initialSize;
      appWindow.title = "GAREN GUI 3.0";
      // appWindow.alignment = Alignment.centerRight;
      appWindow.show();
      // windowManager.setAlwaysOnTop(true);
      windowManager.setBackgroundColor(Colors.transparent);
      Window.setEffect(
        effect: WindowEffect.transparent,
      );
    });
  }
  // WindowOptions windowOptions = WindowOptions(
  //   alwaysOnTop: true,
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: kDebugMode,
      title: 'Garen GUI 3.0',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
    );
  }
}
