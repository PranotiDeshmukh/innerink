import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:innerink_diary/screens/123.dart';

import 'package:innerink_diary/screens/Splashscreen.dart';
import 'package:innerink_diary/screens/agegroup_screen.dart';
import 'package:innerink_diary/screens/create_account.dart';
import 'package:innerink_diary/screens/darkscreen.dart';
import 'package:innerink_diary/screens/genderselectionscreen.dart';
import 'package:innerink_diary/screens/keepdiaryscreen.dart';
import 'package:innerink_diary/screens/lightscreen.dart';
import 'package:innerink_diary/screens/loginscreen.dart';

import 'package:innerink_diary/screens/silderscreen2.dart';
import 'package:innerink_diary/screens/sliderscreen1.dart';
import 'package:innerink_diary/screens/writescreen.dart';
//import 'package:innerink_diary/Splashscreen.dart';
//import 'package:innerink_diary/screens/sliderscreen1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:  'Splashscreen' ,
 
      routes:
       {
        '/createAccount' : (context) => createAccount(),
        '/Loginscreen' : (context) => Loginscreen(),
        '/Silderscreen2' : (context)=> Silderscreen2(),
        '/Silderscreen1' : (context)=> Sliderscreen1(),
        'Splashscreen' : (context)=> Splashscreen(),
        '/GenderSelectionScreen' : (context) => GenderSelectionScreen(),
        '/AgegroupScreen' : (context)=>AgegroupScreen(),
        '/Writescreen' : (context) => Writescreen(),
        '/Keepdiaryscreen' : (context) => Keepdiaryscreen(),
       // '/CurvedBackgroundScreen' : (context)=>CurvedBackgroundScreen(),
       '/maindarkscreen' : (context)=>maindarkscreen(),
         '/mainlightscreen' : (context)=>mainlightscreen(),
       '/LockScreen' : (context)=> LockScreen(),
       
      },
    );
      
       
  }
}

