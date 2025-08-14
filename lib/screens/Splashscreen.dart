import 'dart:async';

import 'package:flutter/material.dart';
import 'package:innerink_diary/screens/loginscreen.dart';
import 'package:innerink_diary/screens/sliderScreens.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override

  void initState(){
    super.initState();

    Timer(const Duration(seconds: 5), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Sliderscreens()));
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient:  LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF7E4A91), // Purple
              Color(0xFF3C5A99), // Dark blue
            ],
          ),
        ),
        
        child: Center(
          child: Image.asset("assets/images/image.png",
          height: 160,
          width: 160,),
       ),
      ),
    );
  }
}