import 'package:flutter/material.dart';
import 'package:innerink_diary/screens/silderscreen2.dart';
//import 'package:innerink_diary/Splashscreen.dart';
//import 'package:innerink_diary/screens/sliderscreen1.dart';
//import 'package:innerink_diary/Splashscreen.dart';
//import 'package:innerink_diary/loginscreen.dart';
//import 'package:innerink_diary/sliderscreen1.dart';   

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Silderscreen2(),
      //Splashscreen(),
      // Loginscreen(  ),
    );
      
       
  }
}

