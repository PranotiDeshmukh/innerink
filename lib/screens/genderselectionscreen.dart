import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innerink_diary/controller/gender_controller.dart';
import 'package:innerink_diary/screens/agegroup_screen.dart';
//import 'gender_controller.dart';

class GenderSelectionScreen extends StatelessWidget {
  final GenderController genderController = Get.put(GenderController());

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
        padding: EdgeInsets.symmetric(vertical: height * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
       
            Padding(
              padding: EdgeInsets.only(left: width * 0.05),
              child: Text(
                'What is your gender?',
                style: TextStyle(
                  fontSize: width * 0.06, // responsive font size
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(height: height * 0.03),

            
            Center(
              child: Image.asset(
                'assets/images/qno1.png',
                height: height * 0.3, // responsive image size
              ),
            ),

            SizedBox(height: height * 0.03),

           
            GenderOption(label: 'Female'),
            GenderOption(label: 'Male'),
            GenderOption(label: 'Other'),

            

            
           
          ],
        ),
      ),
    );
  }
}

class GenderOption extends StatelessWidget {
  final String label;
  final GenderController genderController = Get.find();

  GenderOption({required this.label});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Card(
      margin: EdgeInsets.symmetric(
        vertical: width * 0.02,
        horizontal: width * 0.05,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Obx(
        () => RadioListTile<String>(
          title: Text(
            label,
            style: TextStyle(fontSize: width * 0.045),
          ),
          value: label,
          groupValue: genderController.selectedGender.value,
          onChanged: (value) {
           
            genderController.selectGender(value!);
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AgegroupScreen()));
          },
          activeColor: Colors.purple,
        ),
      ),
    );
  }
}