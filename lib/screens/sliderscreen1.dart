import 'package:flutter/material.dart';
import 'package:innerink_diary/colors/App_color.dart';

class Sliderscreen1 extends StatelessWidget {
  const Sliderscreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
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
          padding: const EdgeInsets.only(top: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Express your \nFeelings",
                style: TextStyle(
                  color: AppColor.secondarycolor,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              
              Padding(
                padding: EdgeInsetsGeometry.symmetric(
                  vertical: 50,
                  horizontal: 100,
                ),
                child: Text(
                  "welcome to InnerInk!!",
                  style: TextStyle(
                    color: AppColor.secondarycolor,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:25.0),
                child: Image.asset("assets/images/smile.png", height: 300, width: 300),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0,top: 110.0),
                child: ElevatedButton(
                  onPressed: () {},
                  style: 
                  ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 14,horizontal: 120,
                    ),
                    backgroundColor: Colors.blue,foregroundColor: AppColor.secondarycolor,
                 ),
                  child: Text("Continue",style: TextStyle(fontSize: 20),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
