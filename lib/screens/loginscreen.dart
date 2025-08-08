import 'package:flutter/material.dart';

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
  Column(
    children: [
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10,top: 25),
            child: Icon(Icons.arrow_back,color: Colors.white,size: 30,),
          ),
          SizedBox(width: 20,),
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Text("Login Page",style: TextStyle(color: Colors.white,fontSize: 25),),
          )
        ],
      ),
      TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            
          )
        ),

      )
    ],
  )

      ),
      
      
    );
  }
}