import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innerink_diary/colors/App_color.dart';
import 'package:innerink_diary/screens/calendarscreen.dart';
import 'package:innerink_diary/screens/darkscreen.dart';
import 'package:innerink_diary/screens/profile.dart';



class mainlightscreen extends StatelessWidget {
  const mainlightscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                 Color(0xFFF5A777), // Top (orange shade)
                 Color(0xFFFF7F7F), // Bottom purple
                ],
              ),
            ),
          ),

          // Curved image at the top
          ClipPath(//cuts the container the way we want 
            clipper: TopCurveClipper(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/light.png"), // your image
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
         // Text("helooo",style: TextStyle(color: Colors.white,fontSize: 40),),
         Padding(
           padding: const EdgeInsets.only(top: 20),
           child: Row(
             children: [
              SizedBox(width: 10,),
               Icon(Icons.menu,color: AppColor.primarycolor,size: 35,),
               SizedBox(width: 180,),
               GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>maindarkscreen()));
                },
                child: Icon(Icons.nightlight,color: AppColor.primarycolor,size: 35,) ,
               ),
               //Icon(Icons.nightlight,color: AppColor.primarycolor,size: 35,),
                SizedBox(width: 15,),
               Icon(Icons.search,color: AppColor.primarycolor,size: 35,),
                SizedBox(width: 15,),
               Icon(Icons.settings,color: AppColor.primarycolor,size: 35,),
                SizedBox(width: 15,),
             ],
           ),
         ),
         

         Padding(
           padding: const EdgeInsets.only(top: 290,left: 10),
           child: Text("2025",style: TextStyle(color: AppColor.primarycolor,fontSize: 35),),
         ),

         Padding(
           padding: const EdgeInsets.only(top: 750),
           child: Row(
            children: [
              SizedBox(width: 15,),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Calendarscreen()));
                },
                child:CircleAvatar(
                
                      backgroundColor: AppColor.ternarycolor,
                      radius: 29,
                      child: Icon(Icons.calendar_today, color: AppColor.secondarycolor,size: 29,),
                    ) ,
              ),
              
                    SizedBox(width: 80,),
           
                     CircleAvatar(
                      radius: 34,
                      backgroundColor: AppColor.secondarycolor,
                      child: Icon(Icons.add, color: AppColor.primarycolor,size: 30,),
                    ),
                     SizedBox(width: 80,),
                     GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));
                      },
                      child:  CircleAvatar(
                      radius: 29,
                      backgroundColor: AppColor.ternarycolor,
                      child: Icon(Icons.person, color: AppColor.secondarycolor,size: 29,),
                    ),
                     ),
           
                     
           
            ],
           ),
         )
        ],
      ),
    );
  }
}

class TopCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.8);
    path.quadraticBezierTo(//to make the curve 
      size.width * 0.5, size.height, // control point
      size.width, size.height * 0.8, // end point
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
