import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innerink_diary/controller/gender_controller.dart';
import 'package:innerink_diary/screens/agegroup_screen.dart';
//import 'gender_controller.dart';

class GenderSelectionScreen extends StatelessWidget {
  final GenderController genderController = Get.put(GenderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFe1bce7), Color(0xFF8a5f99)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
       padding: const EdgeInsets.symmetric( vertical: 40),
        child:
         Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(right: 100),
              child:  Text(
                'What is your gender ? ',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            Image.asset(
              'assets/images/qno1.png', // Replace with your image
              height: 240,
            ),
             SizedBox(height: 20),
            GenderOption(label: 'Female',),
            // GestureDetector(
            //   onTap: ,
            // ),
            GenderOption(label: 'Male'),
            GenderOption(label: 'Other'),
             Spacer(),
             
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children:  [

                
                
                SizedBox(width: 300,),

                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> AgegroupScreen()));
                    
                  },
                  child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.arrow_forward, color: Colors.black,size: 30,),
                ) ,
                )

                
              ],
            )
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
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6 , horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Obx(() => RadioListTile<String>(
            title: Text(label),
            value: label,
            groupValue: genderController.selectedGender.value,
            onChanged: (value) {genderController.selectGender(value!);
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AgegroupScreen()));
            },
            activeColor: Colors.purple,
          ),
          ),
    );
  }
}