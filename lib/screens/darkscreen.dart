import 'package:flutter/material.dart';
import 'package:innerink_diary/colors/App_color.dart';
import 'package:innerink_diary/screens/calendarscreen.dart';
import 'package:innerink_diary/screens/lightscreen.dart';
import 'package:innerink_diary/screens/profile.dart';



class maindarkscreen extends StatelessWidget {
  const maindarkscreen({super.key});

@override
  Widget build(BuildContext context) {
 
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF0D0C3B),
                  Color(0xFF2B2559),
                  Color(0xFF5B3D70),
                ],
              ),
            ),
          ),

          // 🔹 Curved image at the top
          ClipPath(
            clipper: TopCurveClipper(),
            child: Container(
              height: height * 0.5,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/realphoto.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // 🔹 Top bar (menu, sun, search, settings)
          Padding(
            padding: EdgeInsets.only(top: height * 0.03, left: width * 0.03),
            child: Row(
              children: [
                Icon(Icons.menu,
                    color: AppColor.secondarycolor, size: width * 0.09),
                     SizedBox(width: width * 0.46),
              //  Spacer(), // pushes others to right
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const mainlightscreen()),
                    );
                  },
               
                  child: Icon(Icons.sunny,
                      color: AppColor.secondarycolor, size: width * 0.09),
                ),
                SizedBox(width: width * 0.04),
                Icon(Icons.search,
                    color: AppColor.secondarycolor, size: width * 0.09),
                SizedBox(width: width * 0.04),
                Icon(Icons.settings,
                    color: AppColor.secondarycolor, size: width * 0.09),
                SizedBox(width: width * 0.03),
              ],
            ),
          ),

          
          Padding(
            padding: EdgeInsets.only(top: height * 0.35, left: width * 0.03),
            child: Text(
              "2025",
              style: TextStyle(
                color: AppColor.primarycolor,
                fontSize: width * 0.09,
              ),
            ),
          ),

        
          Positioned(
            bottom: height * 0.05,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Calendar
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Calendarscreen()));
                  },
                  child: CircleAvatar(
                    backgroundColor: AppColor.ternarycolor,
                    radius: width * 0.08,
                    child: Icon(Icons.calendar_today,
                        color: AppColor.secondarycolor, size: width * 0.07),
                  ),
                ),

                
                CircleAvatar(
                  radius: width * 0.1,
                  backgroundColor: AppColor.secondarycolor,
                  child: Icon(Icons.add,
                      color: AppColor.primarycolor, size: width * 0.08),
                ),

                // Profile
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProfileScreen()));
                  },
                  child: CircleAvatar(
                    backgroundColor: AppColor.ternarycolor,
                    radius: width * 0.08,
                    child: Icon(Icons.person,
                        color: AppColor.secondarycolor, size: width * 0.07),
                  ),
                ),
              ],
            ),
          ),
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
    path.quadraticBezierTo(
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