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
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
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
                  Color(0xFFF5A777),
                  Color(0xFFFF7F7F),
                ],
              ),
            ),
          ),

          // Curved image
          ClipPath(
            clipper: TopCurveClipper(),
            child: Container(
              height: screenHeight * 0.5,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/light.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // Top icons row
          Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.03),
            child: Row(
              children: [
                SizedBox(width: screenWidth * 0.03),
                Icon(Icons.menu, color: AppColor.primarycolor, size: screenWidth * 0.08),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => maindarkscreen()));
                  },
                  child: Icon(Icons.nightlight, color: AppColor.primarycolor, size: screenWidth * 0.08),
                ),
                SizedBox(width: screenWidth * 0.04),
                Icon(Icons.search, color: AppColor.primarycolor, size: screenWidth * 0.08),
                SizedBox(width: screenWidth * 0.04),
                Icon(Icons.settings, color: AppColor.primarycolor, size: screenWidth * 0.08),
                SizedBox(width: screenWidth * 0.04),
              ],
            ),
          ),

          // Year text
          Positioned(
            top: screenHeight * 0.35,
            left: screenWidth * 0.04,
            child: Text(
              "2025",
              style: TextStyle(
                color: AppColor.primarycolor,
                fontSize: screenWidth * 0.09,
              ),
            ),
          ),

          // Bottom icons row
          Positioned(
            bottom: screenHeight * 0.05,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Calendar button
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Calendarscreen()));
                  },
                  child: CircleAvatar(
                    backgroundColor: AppColor.ternarycolor,
                    radius: screenWidth * 0.08,
                    child: Icon(Icons.calendar_today, color: AppColor.secondarycolor, size: screenWidth * 0.07),
                  ),
                ),

                // Add button
                CircleAvatar(
                  radius: screenWidth * 0.1,
                  backgroundColor: AppColor.secondarycolor,
                  child: Icon(Icons.add, color: AppColor.primarycolor, size: screenWidth * 0.08),
                ),

                // Profile button
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
                  },
                  child: CircleAvatar(
                    radius: screenWidth * 0.08,
                    backgroundColor: AppColor.ternarycolor,
                    child: Icon(Icons.person, color: AppColor.secondarycolor, size: screenWidth * 0.07),
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
      size.width * 0.5, size.height,
      size.width, size.height * 0.8,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
