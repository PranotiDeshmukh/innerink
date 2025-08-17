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
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF7E4A91), // Purple
              Color(0xFF3C5A99), // Dark blue
            ],
          ),
        ),
        child: Center(
          child: Image.asset(
            "assets/images/image.png",
            height: screenHeight * 0.2, // instead of fixed 160
            width: screenWidth * 0.4,   // instead of fixed 160
          ),
        ),
      ),
    );
  }
}