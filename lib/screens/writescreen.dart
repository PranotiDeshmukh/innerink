import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:innerink_diary/colors/App_color.dart';
import 'package:innerink_diary/controller/writescreen_controller.dart';
import 'package:innerink_diary/route/App_routes.dart';
import 'package:innerink_diary/screens/agegroup_screen.dart';
import 'package:innerink_diary/screens/keepdiaryscreen.dart';

class Writescreen extends StatelessWidget {

  final WritescreenController writecontroller =Get.put(WritescreenController());
   Writescreen({super.key});

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
            colors: [Color(0xFFe1bce7), Color(0xFF8a5f99)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: screenHeight * 0.05, // instead of fixed 40
                right: screenWidth * 0.08, // instead of fixed 30
              ),
              child: Text(
                "How often you write diaries ?",
                style: TextStyle(
                  color: AppColor.primarycolor,
                  fontSize: screenWidth * 0.06, // instead of 25
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            SizedBox(height: screenHeight * 0.03),

            Image.asset(
              "assets/images/write.png",
              height: screenHeight * 0.35, // instead of fixed 290
            ),

            SizedBox(height: screenHeight * 0.02),

            writeoption(label: 'I’m new to it'),
            writeoption(label: 'Occasionally'),
            writeoption(label: 'It depends'),
            writeoption(label: 'Frequently'),

            SizedBox(height: screenHeight * 0.12), // instead of fixed 120
          ],
        ),
      ),
    );
  }
}

class writeoption extends StatelessWidget {
  final WritescreenController writecontroller = Get.find();
  final String label;

  writeoption({required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Card(
      margin: EdgeInsets.symmetric(
        vertical: screenWidth * 0.015, // instead of fixed 6
        horizontal: screenWidth * 0.05, // instead of fixed 20
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Obx(
        () => RadioListTile(
          title: Text(
            label,
            style: TextStyle(fontSize: screenWidth * 0.045), // responsive text
          ),
          value: label,
          groupValue: writecontroller.selectedwrite.value,
          onChanged: (value) {
            writecontroller.selectedwrite(value!);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Keepdiaryscreen()),
            );
          },
          activeColor: Colors.purple,
        ),
      ),
    );
  }
}