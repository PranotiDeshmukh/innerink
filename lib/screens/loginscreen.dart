import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innerink_diary/colors/App_color.dart';
import 'package:innerink_diary/screens/create_account.dart';
import 'package:innerink_diary/screens/genderselectionscreen.dart';
import 'package:innerink_diary/screens/sliderScreens.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Container(
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
  child: 
  
  SingleChildScrollView(scrollDirection: Axis.vertical,
    child: Column(
      
      children: [
        
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10,top: 25),
              
              child:
              IconButton(onPressed: (){
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Sliderscreens()));
                },
                
              );
              }, icon:  Icon(Icons.arrow_back,color: AppColor.secondarycolor,size: 30,),),
              
               //Icon(Icons.arrow_back,color: AppColor.secondarycolor,size: 30,),
            ),
            SizedBox(width: 20,),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Text("Login Page",style: TextStyle(color : AppColor.secondarycolor,fontSize: 25),),
            )
          ],
        ),
        SizedBox(height: 40,),
    
        Image.asset("assets/images/loginimage.png"),
        SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,),
          child: TextFormField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.email_outlined,),
              hint: Text("Email",style: TextStyle(color: AppColor.ternarycolor,),),
              filled: true,
              fillColor: AppColor.secondarycolor,
              border: OutlineInputBorder(
    
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                
                
                
              )
            ),
          
          ),
        ),
        SizedBox(height: 20,),
    
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,),
          child: TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock,),
              hint: Text("password",style: TextStyle(color: AppColor.ternarycolor),),
              suffixIcon: Icon(Icons.remove_red_eye),
              fillColor: AppColor.secondarycolor,
              filled: true,
              border : OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              )
            ),
            
          
          ),
        ),
        SizedBox(height: 30,),
    
        
         // padding: const EdgeInsets.only(left: 40),
          //child:
           ElevatedButton
          (onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> GenderSelectionScreen()));
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 145,vertical: 14),
            backgroundColor: Colors.blue),
           child: Text("Login",style: TextStyle(color: AppColor.secondarycolor,fontSize: 20),),),

            SizedBox(height: 15,),
            Text("OR",style: TextStyle(color: AppColor.secondarycolor,),),
            SizedBox(height: 15,),
           Text("Don't have any account ? ",style: TextStyle(color: const Color.fromARGB(255, 182, 180, 180),fontSize: 18),),
           TextButton(onPressed: (){},
           child:
           GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> createAccount()));
            },
            child: const Text("Create Account ",style: TextStyle(color: Colors.blue,fontSize: 22),),

           ),
            ),
           
        
      ],
    ),
  )

      ),
      
      
    );
  }
}