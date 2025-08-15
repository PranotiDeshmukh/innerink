import 'package:flutter/material.dart';
import 'package:innerink_diary/colors/App_color.dart';
import 'package:innerink_diary/screens/profile.dart';

class mainscreen extends StatefulWidget {
  const mainscreen({super.key});

  @override
  State<mainscreen> createState() => _mainscreenState();
}

class _mainscreenState extends State<mainscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: 
    
      Padding(
                  padding: const EdgeInsets.only(left: 30.0,top: 110.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));
                    },
                    style: 
                    ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 14,horizontal: 120,
                      ),
                      backgroundColor: Colors.blue,foregroundColor: AppColor.secondarycolor,
                   ),
                    child: Text("Continue",style: TextStyle(fontSize: 20),),
                  ),
                ),
    );
  }
}