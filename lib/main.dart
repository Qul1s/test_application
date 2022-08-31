import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

import 'helper.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Test Application',
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>{
  int colorRed = 50;
  int colorGreen = 50;
  int colorBlue = 50;
  int counter = 0;

  @override
  void initState() {
    super.initState();
    _loadColor();
  }

  Future<void> _loadColor() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      colorRed = (prefs.getInt('colorRed') ?? 50);
      colorGreen = (prefs.getInt('colorGreen') ?? 50);
      colorBlue = (prefs.getInt('colorBlue') ?? 50);
    });
  }

  Future<void> _saveColor(colorRed, colorGreen, colorBlue) async {
    final prefs = await SharedPreferences.getInstance();
      prefs.setInt("colorRed", colorRed);
      prefs.setInt("colorGreen", colorGreen);
      prefs.setInt("colorBlue", colorBlue);
  }


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
        child: Container(
          color: Color.fromRGBO(colorRed, colorGreen, colorBlue, 1),
          alignment: Alignment.center,
          child: const Text("Hey there",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color.fromRGBO(255, 255, 255, 1),
            fontSize: 32,
            fontWeight: FontWeight.bold,
            fontFamily: "KyivTypeSans"
            ),)
        ),
        onTap: () {
          var random = Random();
          setState(() {
            colorRed = random.nextInt(256);
            colorGreen = random.nextInt(256);
            colorBlue = random.nextInt(256);
            counter++;
          });
          if (counter%10 == 0){
            ShowDialog("Ви змінили колір вже $counter разів", context);
          }
          _saveColor(colorRed, colorGreen, colorBlue);
        },
      ));
  }



}
