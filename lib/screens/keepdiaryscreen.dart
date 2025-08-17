import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:innerink_diary/colors/App_color.dart';
import 'package:innerink_diary/controller/keepdiary_controller.dart';
import 'package:innerink_diary/screens/darkscreen.dart';
//import 'package:innerink_diary/screens/mainscreen.dart';
//import 'package:innerink_diary/controller/writescreen_controller.dart';

class Keepdiaryscreen extends StatelessWidget {
     KeepdiaryController keepcontroller = Get.put(KeepdiaryController());
     Keepdiaryscreen({super.key});

  @override
  Widget build(BuildContext context) {
     final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;


   return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFe1bce7), Color(0xFF8a5f99)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            // 🔹 Title
            Padding(
              padding: EdgeInsets.only(top: height * 0.05, left: width * 0.05),
              child: Text(
                "Why do you want to keep Diaries ?",
                style: TextStyle(
                  color: AppColor.primarycolor,
                  fontSize: width * 0.06,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(height: height * 0.03),

            // 🔹 Image
            Image.asset(
              "assets/images/keepdiary.png",
              height: height * 0.25, // responsive image size
            ),

            SizedBox(height: height * 0.03),

            // 🔹 Options
            KeepOption(label: 'Deal with stress'),
            KeepOption(label: 'Daily Reflection'),
            KeepOption(label: 'Deal with anxiety'),
            KeepOption(label: 'For Positivity'),
            KeepOption(label: 'Not sure'),

            SizedBox(height: height * 0.04),

            // 🔹 Login Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => maindarkscreen()));
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.25, // responsive width
                  vertical: height * 0.018,
                ),
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                "Login",
                style: TextStyle(
                  color: AppColor.secondarycolor,
                  fontSize: width * 0.05,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class KeepOption extends StatelessWidget {
  final KeepdiaryController keepcontroller = Get.find();
  final String label;

  KeepOption({required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Card(
      margin: EdgeInsets.symmetric(
        vertical: width * 0.02,
        horizontal: width * 0.05,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // ✅ fixed here
      ),
      child: Obx(
        () => RadioListTile(
          title: Text(
            label,
            style: TextStyle(fontSize: width * 0.045),
          ),
          value: label,
          groupValue: keepcontroller.selectedkeepdiary.value,
          onChanged: (value) => keepcontroller.selectkeepdiary(value!),
          activeColor: AppColor.primarycolor,
        ),
      ),
    );
  }
}