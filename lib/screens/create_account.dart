import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:innerink_diary/colors/App_color.dart';

class createAccount extends StatefulWidget {
  const createAccount({super.key});

  @override
  State<createAccount> createState() => _createAccountState();
}

class _createAccountState extends State<createAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient:  LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xFF1F1F66), // Dark Blue
        Color(0xFF3F3F8F), // Mid Blue
        Color(0xFF6B3F75), // Purple
      ],
    ),
  ),
  child: Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 10,top: 25),
        child: Row(
          children: [
            IconButton(onPressed: (){},
             icon:Icon(Icons.arrow_back,color: AppColor.secondarycolor,size: 30,), ),
            
           
            SizedBox(width: 18,),
            Text("Create Account ",style: TextStyle(color: AppColor.secondarycolor,fontSize: 25),)
          ],
        ),
      ),

      SizedBox(height: 90,),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,),
        child: TextFormField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.account_box,),
            hintText: "Username",
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
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextFormField(
          decoration:
           InputDecoration(
            prefixIcon: Icon(Icons.mail_outlined),
            hint: Text("Email"),
            filled: true,
            fillColor: AppColor.secondarycolor,
        
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(08),
              borderSide: BorderSide.none,
        
            )
        
          ),
        ),
      ),
      SizedBox(height: 20,),

      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextFormField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.lock),
            hintText: "password",
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
             borderRadius: BorderRadius.circular(08),
             borderSide: BorderSide.none,
            ),
          ),
        ),
      ),

      SizedBox(height: 30,),


      Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Row(
          children: [
            ElevatedButton(onPressed: (){},
            style:
             ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              
              padding: EdgeInsets.symmetric(vertical: 10 , horizontal: 45),
              
            ),
             child: Text("Sign Up",style: TextStyle(color: AppColor.secondarycolor,fontSize: 20),)),
        
            SizedBox(width: 24,),
        
              OutlinedButton(onPressed: (){},
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 45),
                backgroundColor: AppColor.secondarycolor,
              ),
               child: Text("Sign In",style: TextStyle(color: Colors.blue,fontSize: 20),),),
          ],
        ),
      )

      

    
    ],
  )
        ),
    
    );
  }
}