// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:number_inc_dec/number_inc_dec.dart';
import 'package:flutter/services.dart';
import 'package:window_size/window_size.dart';




void main() {
  runApp(const MyApp());
  setWindowTitle("Garen GUI 3.0");
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Garen GUI 3.0',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
      switch (level){
        case 1:
            if(totHealth<=150){
              total = totHealth;
            }else{
            total = ((totHealth + 600) ~/ 5);
            }
            break;
        case 2:
            if(totHealth<=300){
              total = totHealth;
            }else{
            total = ((totHealth + 1000) * 3 ~/ 13);
            }
            break;
        case 3:
            if(totHealth<=450){
              total = totHealth;
            }else{
            total = ((totHealth + 9000 / 7) * 7 ~/ 27);
            }
            break;
        default:
            break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Garen GUI 3.0"),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: SizedBox(
          width: 600,
          child: Wrap(
            runAlignment: WrapAlignment.center,
            spacing: 20,
            runSpacing: 20,
            children: <Widget>[
              NumberInputWithIncrementDecrement(
                initialValue: 1,
                controller: TextEditingController(),
                onIncrement: (num lv) {
                  calculate(lv.toInt(), totHealth);
                  level=lv.toInt();
                },
                onDecrement: (num lv) {
                  calculate(lv.toInt(), totHealth);
                  level=lv.toInt();
                },
                min: 1,
                max: 3,
              ),
              TextField(
                controller: controllerMaxHP,
                maxLength: 5,
                onChanged: (value){
                  if(value.isNotEmpty){
                    totHealth=int.parse(value);
                    calculate(level, int.parse(value));
                  }
                },
                //initialValue: '0',
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter target maximum health points'
                ),
                keyboardType: TextInputType.number,
              ),
              Text("Optimal damage: $total"),
            ],
          ),
        ),
      ),
    );
  }
}
