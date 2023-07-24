import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_acrylic/window.dart';
import 'package:flutter_acrylic/window_effect.dart';
// import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:number_inc_dec/number_inc_dec.dart';
import 'package:flutter/services.dart';
import 'dart:io' show File, Platform, Process;
// import 'package:window_manager/window_manager.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:image/image.dart' as img;
import 'package:window_manager/window_manager.dart';

class Enemy {
  int hp = 0;
  int maxHp = 0;
}

class WindowOverlay extends StatefulWidget {
  const WindowOverlay({Key? key}) : super(key: key);

  @override
  State<WindowOverlay> createState() => _WindowOverlayState();
}

class _WindowOverlayState extends State<WindowOverlay> {
  int totHealth = 0;
  int total = 0;
  int level = 1;
  final controllerMaxHP = TextEditingController();
  final controllerLevel = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  // TODO: aggiungere la possibilità di personalizzare la dimensione e posizione dello screenshot
  // TODO: migliorare ocr, testare https://pub.dev/packages?q=platform%3Awindows+ocr
  // TODO: automatizzare inserimento livello ultimate
  // TODO: cancellare file inutili
  // TODO: usare https://127.0.0.1:2999/liveclientdata/allgamedata per ottenere il livello della ulti
  // TODO: mostrare hp attuali
  Future<void> ocr(TextEditingController level, Enemy enemy, TextEditingController controllerMaxHp, KeyEvent event) async {
    String nirPath;
    String ocrPath;
    if (kDebugMode) {
      nirPath = "lib/nircmd-x64/nircmd.exe";
      ocrPath = "lib/Tesseract-OCR/tesseract.exe";
    } else {
      nirPath = "nircmd-x64/nircmd.exe";
      ocrPath = "Tesseract-OCR/tesseract.exe";
      controllerMaxHP.text = "69420";
    }
    while (true) {
      // wait 1 second
      // await Future.delayed(const Duration(milliseconds: 100));
      // TODO: usare https://pub.dev/packages/win32 screenshot.dart , o meglio, https://pub.dev/packages/screen_capturer
      dynamic process = await Process.start(nirPath, ['savescreenshot', 'screen1.png', '230', '40', '150', '25']);
      // stdout.addStream(process.stdout);
      // stderr.addStream(process.stderr);
      await process.exitCode;
      try {
        // turn image to gray scale
        img.Image? image = img.decodePng(File('screen1.png').readAsBytesSync());
        image = img.invert(image!);
        image = img.adjustColor(image, gamma: 0.179, saturation: 0.0);
        // image = img.grayscale(image);
        // save image
        File('screen1.png').writeAsBytesSync(img.encodePng(image));
        process = await Process.start(ocrPath, ['screen1.png', 'text', '-l', 'eng', 'digits']);
      } catch (e) {
        print(e);
      }
      // stdout.addStream(process.stdout);
      // stderr.addStream(process.stderr);
      await process.exitCode;
      // extract string from file with regex and print it
      RegExp regExp = RegExp(r'\d+\/\d+');
      String text = File('text.txt').readAsStringSync();
      if (kDebugMode) {
        print(regExp.stringMatch(text));
      }
      try {
        enemy.hp = int.tryParse((regExp.stringMatch(text)!.replaceAll(RegExp(r'\/\d+'), ''))) ?? 0;
        print("enemy hp: " + enemy.hp.toString());
        enemy.maxHp = int.tryParse((regExp.stringMatch(text)!.replaceAll(RegExp(r'\d+\/'), ''))) ?? 0;
        print("enemy max hp: " + enemy.maxHp.toString());
        controllerMaxHP.text = enemy.maxHp.toString();
        calculate(int.parse(level.text), enemy.maxHp);
      } catch (e) {
        enemy.hp = 0;
        enemy.maxHp = 0;
      }
    }
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
    return KeyboardListener(
      onKeyEvent: (value) => value.logicalKey == LogicalKeyboardKey.pageUp ? getBackToMainWindow(context) : null,
      focusNode: FocusNode(),
      child: SizedBox(
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
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 1.0),
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
                          controller: controllerLevel,
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
                              // clearText();
                              Enemy enemy = Enemy();

                              ocr(controllerLevel, enemy, controllerMaxHP, event);
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
                            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                        Column(
                          children: [
                            Text(
                              "Optimal damage: $total",
                              style: const TextStyle(height: 1, fontSize: 11),
                            ),
                            Text(
                              "Press Page Up to hide overlay",
                              style: TextStyle(height: 1, fontSize: 11),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ))
            ],
          )),
    );
  }

  getBackToMainWindow(BuildContext context) {
    Window.setEffect(
      effect: WindowEffect.transparent,
    );
    appWindow.hide();
    Navigator.of(context).pop();
    const initialSize = Size(500, 500);
    appWindow.minSize = initialSize;
    appWindow.size = initialSize;
    appWindow.title = "GAREN";
    appWindow.alignment = Alignment.center;
    appWindow.show();
    windowManager.setAlwaysOnTop(false);
  }
}
