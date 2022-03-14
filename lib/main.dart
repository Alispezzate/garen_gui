// ignore_for_file: prefer_const_constructors
// TODO: overlay in game
// TODO: versione macos ufficiale
// TODO: aggiungere msix
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:number_inc_dec/number_inc_dec.dart';
import 'package:flutter/services.dart';
import 'dart:io' show Platform;
import 'package:window_manager/window_manager.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

// Future<void> main() async {
//   if (!kIsWeb) {
//     if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
//       WidgetsFlutterBinding.ensureInitialized();
//       // Must add this line.
//       await windowManager.ensureInitialized();
//       await Window.initialize();
//     }
//   }
//   runApp(const MyApp());
//   if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
//     windowManager.setAlwaysOnTop(true);
//     windowManager.setTitle("Garen GUI 3.0");
//     // windowManager.setOpacity(1);
//     await Window.setEffect(effect: WindowEffect.acrylic);
//   }
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Window.initialize();
  if (Platform.isWindows) {
    await Window.hideWindowControls();
  }
  runApp(MyApp());
  if (Platform.isWindows) {
    doWhenWindowReady(() async {
      appWindow.minSize = Size(300, 350);
      appWindow.size = Size(300, 350);
      appWindow.alignment = Alignment.center;
      appWindow.show();
      Window.setEffect(effect: WindowEffect.acrylic);
    });
  }
}

// ThemeData defaultTheme =
//     ThemeData(brightness: Brightness.dark, primarySwatch: Colors.green);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // TODO: indagare sulla top bar di colore diverso
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
    Window.setEffect(
      effect: WindowEffect.acrylic,
      color: Color(0xCC222222),
    );
  }

  // void setWindowEffect(WindowEffect? value) {
  //   Window.setEffect(
  //     effect: value!,
  //     color: Colors.grey,
  //     dark: true,
  //   );
  //   // if (Platform.isMacOS) {
  //   //   if (brightness != InterfaceBrightness.auto) {
  //   //     Window.overrideMacOSBrightness(
  //   //         dark: brightness == InterfaceBrightness.dark);
  //   //   }
  //   // }
  //   // setState(() => this.effect = value);
  // }

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
    return Scaffold(
      appBar: AppBar(
        title: Text("Garen GUI 3.0"),
        backgroundColor: Color(0xFF212121),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        alignment: Alignment.topCenter,
        // color: Colors.redAccent.withOpacity(0.5),
        child: SizedBox(
          width: 500,
          child: Wrap(
            runAlignment: WrapAlignment.center,
            runSpacing: 10,
            children: <Widget>[
              Text(
                "Garen ultimate level",
                style: TextStyle(height: 1, fontSize: 18),
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
              SizedBox(
                height: 0,
                width: 600,
              ),
              Text(
                "Target maximum health points",
                style: TextStyle(height: 1, fontSize: 18),
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
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter target maximum health points',
                    suffixIcon: IconButton(
                      onPressed: controllerMaxHP.clear,
                      icon: Icon(Icons.clear),
                      splashRadius: 18,
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Text(
                "Optimal damage: $total",
                style: TextStyle(height: 1, fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
