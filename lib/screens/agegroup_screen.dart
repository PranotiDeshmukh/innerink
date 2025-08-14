import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:innerink_diary/colors/App_color.dart';
import 'package:innerink_diary/controller/agegroup_controller.dart';
import 'package:innerink_diary/route/App_routes.dart';
import 'package:innerink_diary/screens/genderselectionscreen.dart';
import 'package:innerink_diary/screens/writescreen.dart';

class AgegroupScreen extends StatelessWidget {
  final AgegroupController agecontroller = Get.put(AgegroupController());
   AgegroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration:  const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFe1bce7), Color(0xFF8a5f99)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: 
        Column(
          children: [
            
           Padding(
             padding: const EdgeInsets.only(right: 70 ,top: 40),
             child: Text("What is your age group ?",style: TextStyle(color: AppColor.primarycolor,fontSize: 25,fontWeight: FontWeight.bold),),
           ),
           SizedBox(height: 35,),
           Image.asset("assets/images/age.png",height: 200,),
           SizedBox(height: 40,),
          

           ageoption(label: 'Teenager'),
           ageoption(label: 'Youngster'),
           ageoption(label: 'Adult'),
           ageoption(label: 'Old'),

           SizedBox(height: 150,),

           Row(
            children: [
              
              GestureDetector(
                 onTap :() {
                  Navigator.pop(context, MaterialPageRoute(builder: (context)=> GenderSelectionScreen()));
                 },
                 child: 
                 Padding(
                   padding: const EdgeInsets.only(left: 10,),
                   child:
                   GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> GenderSelectionScreen()));
                    },
                    child:CircleAvatar(
                                   backgroundColor: AppColor.secondarycolor,
                                   child: Icon(Icons.arrow_back,color: AppColor.primarycolor,size: 30,),
                                 ), 
                   ) ,
                 ),
              ),
              // CircleAvatar(
              //   backgroundColor: AppColor.secondarycolor,
              //   child: Icon(Icons.arrow_back,color: AppColor.primarycolor,size: 30,),
              // ),
              SizedBox(width: 280,),
               GestureDetector(
                 onTap :() {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Writescreen()));
                   
                 },
                 child: 
                   CircleAvatar(
                backgroundColor: AppColor.secondarycolor,
                child: Icon(Icons.arrow_forward,color: AppColor.primarycolor,size: 30,),
              ),
              ),
              // CircleAvatar(
              //   backgroundColor: AppColor.secondarycolor,
              //   child: Icon(Icons.arrow_forward,color: AppColor.primarycolor,size: 30,),
              // ),
            ],
           )
          ],
        )
      ),
      
    );
  }
}

class ageoption extends StatelessWidget {

  AgegroupController agecontroller = Get.find();
  String label;

   ageoption({required this.label});

  @override
  Widget build(BuildContext context) {
    return  Card(
      margin: EdgeInsets.symmetric(vertical: 06 , horizontal: 20),
      shape: RoundedRectangleBorder(
       borderRadius: BorderRadius.circular(12),
      ),
      child: Obx(() => RadioListTile(
        title: Text(label),
        value: label,
        
         groupValue: agecontroller.selectedAge.value,
          onChanged: (Value){
            agecontroller.selectedAge(Value!);
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Writescreen()));
          },
          activeColor: Colors.purple,)),
    );
  }
}