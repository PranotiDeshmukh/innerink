import 'package:flutter/material.dart';
import 'package:innerink_diary/colors/App_color.dart';
import 'package:innerink_diary/screens/loginscreen.dart';

class Silderscreen2 extends StatelessWidget {
  const Silderscreen2({super.key});

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
        child: Padding(
          padding: EdgeInsets.only(top: screenHeight * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Express your \n Dreams",
                style: TextStyle(
                  color: AppColor.secondarycolor,
                  fontSize: screenWidth * 0.09, // Responsive font
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.06,
                  horizontal: screenWidth * 0.25,
                ),
                child: Text(
                  "Welcome to InnerInk",
                  style: TextStyle(
                    color: AppColor.secondarycolor,
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.08),
                child: Image.asset(
                  "assets/images/slider2.png",
                  height: screenHeight * 0.35,
                  width: screenWidth * 0.7,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: screenWidth * 0.07,
                  top: screenHeight * 0.12,
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
                      vertical: screenHeight * 0.018,
                      horizontal: screenWidth * 0.30,
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
    );
  }
}