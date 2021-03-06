// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:number_inc_dec/number_inc_dec.dart';
import 'package:flutter/services.dart';
import 'package:window_size/window_size.dart';
import 'dart:io' show Platform;

void main() {
  runApp(const MyApp());
  if (!kIsWeb) {
    if (Platform.isWindows) {
      setWindowTitle("Garen GUI 3.0");
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // TODO: indagare sulla top bar di colore diverso
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
