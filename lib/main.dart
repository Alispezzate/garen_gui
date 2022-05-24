// TODO: aggiungere msix
import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:number_inc_dec/number_inc_dec.dart';
import 'package:flutter/services.dart';
import 'dart:io' show Platform, Process, stderr, stdout;
import 'package:window_manager/window_manager.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

Future<void> main() async {
  dynamic process = await Process.start('./lib/Tesseract-OCR/tesseract.exe',
      ['lib/Tesseract-OCR/screen1.png', 'text', '-l', 'eng']);
  stdout.addStream(process.stdout);
  stderr.addStream(process.stderr);
  await process.exitCode;
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  await Window.initialize();
  runApp(const MyApp());
  if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
    doWhenWindowReady(() async {
      const initialSize = Size(170, 220);
      appWindow.minSize = initialSize;
      appWindow.size = initialSize;
      appWindow.title = "GAREN";
      appWindow.alignment = Alignment.centerRight;
      appWindow.show();
      windowManager.setAlwaysOnTop(true);
      Window.setEffect(
        effect: WindowEffect.transparent,
      );
    });
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Garen GUI 3.0',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int totHealth = 0;
  int total = 0;
  int level = 1;
  final controllerMaxHP = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void calculate(int level, int totHealth) {
    setState(() {
      switch (level) {
        case 1:
          if (totHealth <= 150) {
            total = totHealth;
          } else {
            total = ((totHealth + 600) ~/ 5);
          }
          break;
        case 2:
          if (totHealth <= 300) {
            total = totHealth;
          } else {
            total = ((totHealth + 1000) * 3 ~/ 13);
          }
          break;
        case 3:
          if (totHealth <= 450) {
            total = totHealth;
          } else {
            total = ((totHealth + 9000 / 7) * 7 ~/ 27);
          }
          break;
        default:
          break;
      }
    });
  }

  void clearText() {
    controllerMaxHP.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 200,
        child: Column(
          children: [
            WindowTitleBarBox(
                child: Stack(
              children: [
                Container(
                  color: const Color.fromARGB(140, 0, 0, 0),
                ),
                MoveWindow(),
              ],
            )),
            Expanded(
                child: Scaffold(
              backgroundColor: const Color.fromARGB(110, 0, 0, 0),
              body: Container(
                padding:
                    const EdgeInsets.only(left: 10.0, right: 10.0, top: 1.0),
                alignment: Alignment.topCenter,
                child: SizedBox(
                  width: 500,
                  child: Wrap(
                    runAlignment: WrapAlignment.center,
                    runSpacing: 5,
                    children: <Widget>[
                      const Text(
                        "Garen ultimate level",
                        style: TextStyle(height: 1, fontSize: 11),
                      ),
                      NumberInputWithIncrementDecrement(
                        initialValue: 1,
                        controller: TextEditingController(),
                        onIncrement: (num lv) {
                          level = lv.toInt();
                          calculate(level, totHealth);
                        },
                        onDecrement: (num lv) {
                          level = lv.toInt();
                          calculate(level, totHealth);
                        },
                        min: 1,
                        max: 3,
                      ),
                      const Text(
                        "Target maximum health points",
                        style: TextStyle(height: 1, fontSize: 11),
                      ),
                      KeyboardListener(
                        focusNode: FocusNode(), // or FocusNode()
                        onKeyEvent: (event) {
                          if (event.logicalKey == LogicalKeyboardKey.escape) {
                            // here you can check if textfield is focused
                            clearText();
                          }
                        },
                        child: TextField(
                          controller: controllerMaxHP,
                          maxLength: 5,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              totHealth = int.parse(value);
                              calculate(level, totHealth);
                            }
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(left: 5),
                            border: const OutlineInputBorder(),
                            hintText: 'Enter target maximum health points',
                            suffixIcon: IconButton(
                              onPressed: controllerMaxHP.clear,
                              icon: const Icon(Icons.clear),
                              splashRadius: 18,
                            ),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      Text(
                        "Optimal damage: $total",
                        style: const TextStyle(height: 1, fontSize: 11),
                      ),
                    ],
                  ),
                ),
              ),
            ))
          ],
        ));
  }
}
