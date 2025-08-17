import 'package:flutter/material.dart';
import 'package:innerink_diary/colors/App_color.dart';
import 'package:innerink_diary/screens/loginscreen.dart';

class Sliderscreen1 extends StatelessWidget {
  const Sliderscreen1({super.key});

  @override
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
              Color(0xFF1F1F66), // Dark Blue
              Color(0xFF3F3F8F), // Mid Blue
              Color(0xFF6B3F75), // Purple
            ],
          ),
        ),
        child: 
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Express your \nFeelings",
                  style: TextStyle(
                    color: AppColor.secondarycolor,
                    fontSize: screenWidth * 0.1, // responsive font
                    fontWeight: FontWeight.bold,
                  ),
                ),
                
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.06,
                    horizontal: screenWidth * 0.25,
                  ),
                  child: Text(
                    "welcome to InnerInk!!",
                    style: TextStyle(
                      color: AppColor.secondarycolor,
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.11),
                  child: Image.asset(
                    "assets/images/smile.png",
                    height: screenHeight * 0.35,
                    width: screenWidth * 0.7,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: screenWidth * 0.08,
                    top: screenHeight * 0.13,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Loginscreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.02,
                        horizontal: screenWidth * 0.3,
                      ),
                      backgroundColor: Colors.blue,
                      foregroundColor: AppColor.secondarycolor,
                    ),
                    child: Text(
                      "Continue",
                      style: TextStyle(fontSize: screenWidth * 0.05),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}