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
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration:  const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFe1bce7), Color(0xFF8a5f99)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top:40 ,right:30 ),
            child: Text("How often you write diaries ?",style: TextStyle(color: AppColor.primarycolor,fontSize: 25,fontWeight: FontWeight.bold),),
          ),
          Image.asset("assets/images/write.png",height: 290,),

          writeoption(label: 'I’m new to it'),
          writeoption(label: 'Occasionally'),
          writeoption(label: 'It depends'),
          writeoption(label: 'Frequently'),

          SizedBox(height: 120,),

          Padding(
            padding: const EdgeInsets.only(left: 10,),
            child: Row(
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                              context,
                                  MaterialPageRoute(builder: (context) => AgegroupScreen()),
                            );
                  },
                    child: CircleAvatar(
                    backgroundColor: AppColor.secondarycolor,
                        child: Icon(Icons.arrow_back,color: AppColor.primarycolor,size: 30,),
                                    ),
                  
            
                ),
                // CircleAvatar(
                //   backgroundColor: AppColor.secondarycolor,
                //       child: Icon(Icons.arrow_back,color: AppColor.primarycolor,size: 30,),
                // ),
                
                SizedBox(width: 280,),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Keepdiaryscreen() ));
                  },
                  child:                 Padding(
                   padding: const EdgeInsets.only(right: 10),
                   
                   child: CircleAvatar(
                    backgroundColor: AppColor.secondarycolor,
                        child: Icon(Icons.arrow_forward,color: AppColor.primarycolor,size: 30,),
                                   ),
                 ), 
                ),
            
                 
              ],
            ),
          )
          

        ],),
      ),
    );
  }
  }

  class writeoption extends StatelessWidget {
     WritescreenController writecontroller = Get.find();
     String label;

     writeoption({required this.label});

  @override
  Widget build(BuildContext context) {
   
  
    return Card(
      margin: EdgeInsets.symmetric(vertical: 06 , horizontal: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Obx(() => RadioListTile(
        title: Text(label),
        value: label,
       groupValue: writecontroller.selectedwrite.value,
        onChanged:(value) {
          writecontroller.selectedwrite(value!);
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Keepdiaryscreen()));
        } ,
        activeColor: Colors.purple,)),
    );
  }
}