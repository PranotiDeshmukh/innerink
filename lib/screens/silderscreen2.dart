import 'package:flutter/material.dart';

class Silderscreen2 extends StatelessWidget {
  const Silderscreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Express your \n Dreams",
            style: TextStyle(color: Colors.white,
            fontSize: 40,
            fontWeight: FontWeight.bold,
            ),),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50,horizontal: 100 ),
              child: Text("Welcome to InnerInk",style: TextStyle(color: Colors.white,fontSize: 18 ,fontWeight: FontWeight.w500),),
            ),

            Image.asset("assets/images/dream.png")
          ],
        )
      ,),
    );
  }
}