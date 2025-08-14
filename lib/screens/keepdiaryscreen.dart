import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:innerink_diary/colors/App_color.dart';
import 'package:innerink_diary/controller/keepdiary_controller.dart';
import 'package:innerink_diary/screens/mainscreen.dart';
//import 'package:innerink_diary/controller/writescreen_controller.dart';

class Keepdiaryscreen extends StatelessWidget {
     KeepdiaryController keepcontroller = Get.put(KeepdiaryController());
     Keepdiaryscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      
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
        child: 
        Column(
          children: [
             Padding(
          padding: const EdgeInsets.only(top: 40 , left: 20),
          child: Text("Why do you want to keep Diaries ?",style: TextStyle(color:AppColor.primarycolor,fontSize:25,fontWeight: FontWeight.bold  ),),
        ),

        Image.asset("assets/images/keepdiary.png",height: 200,),


        keepoption(label: 'Deal with stress'),
        keepoption(label: 'Daily Reflection'),
        keepoption(label: 'Deal with anxiety'),
        keepoption(label: 'For Positivity'),
        keepoption(label: 'not sure'),

        // Row(
        //   children: [
        //     CircleAvatar(
        //       backgroundColor: AppColor.secondarycolor,
        //       child: Icon(Icons.arrow_back,size: 30,)
        //     ),
        //      SizedBox(width: 300,),
        //      CircleAvatar(
        //       backgroundColor: AppColor.secondarycolor,
        //       child: Icon(Icons.arrow_forward,size: 30,)
        //     )
        //   ],
        // )
        SizedBox(height: 20,),

        ElevatedButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> mainscreen()));
        },
        style: ElevatedButton.styleFrom( padding: EdgeInsets.symmetric(horizontal: 145,vertical: 14),
            backgroundColor: Colors.blue),
           child: Text("Login",style: TextStyle(color: AppColor.secondarycolor,fontSize: 20),),),

        

          ],
        )
        
        
      ),
    );
  }
}

class keepoption extends StatelessWidget {
    KeepdiaryController keepcontroller = Get.find();
    String label;

   keepoption({required this.label});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical:8,horizontal: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(12),
      ),
      child: Obx(()=> RadioListTile(
        title: Text(label),
        value: label, 
      groupValue: keepcontroller.selectedkeepdiary.value, 
      onChanged: (Value)=> keepcontroller.selectkeepdiary(Value!),
      )),
    );
  }
}