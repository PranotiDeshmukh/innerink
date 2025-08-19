// import 'package:flutter/material.dart';
// import 'package:innerink_diary/colors/App_color.dart';
// import 'package:innerink_diary/screens/addentryscreen.dart';
// import 'package:innerink_diary/screens/calendarscreen.dart';
// import 'package:innerink_diary/screens/lightscreen.dart';
// import 'package:innerink_diary/screens/profile.dart';
// import 'package:shared_preferences/shared_preferences.dart';



// class maindarkscreen extends StatelessWidget {
//   const maindarkscreen({super.key});

// @override
//   Widget build(BuildContext context) {
 
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;

//     return Scaffold(
//       body: Stack(
//         children: [
          
//           Container(
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//                 colors: [
//                   Color(0xFF0D0C3B),
//                   Color(0xFF2B2559),
//                   Color(0xFF5B3D70),
//                 ],
//               ),
//             ),
//           ),

//           // 🔹 Curved image at the top
//           ClipPath(
//             clipper: TopCurveClipper(),
//             child: Container(
//               height: height * 0.5,
//               decoration: const BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage("assets/images/realphoto.png"),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           ),

//           // 🔹 Top bar (menu, sun, search, settings)
//           Padding(
//             padding: EdgeInsets.only(top: height * 0.03, left: width * 0.03),
//             child: Row(
//               children: [
//                 Icon(Icons.settings,
//                     color: AppColor.secondarycolor, size: width * 0.09),
//                      SizedBox(width: width * 0.60),
//               //  Spacer(), // pushes others to right
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => const mainlightscreen()),
//                     );
//                   },
               
//                   child: Icon(Icons.sunny,
//                       color: AppColor.secondarycolor, size: width * 0.09),
//                 ),
//                 SizedBox(width: width * 0.04),
//                 Icon(Icons.search,
//                     color: AppColor.secondarycolor, size: width * 0.09),
//                 SizedBox(width: width * 0.04),
//                 // Icon(Icons.settings,
//                 //     color: AppColor.secondarycolor, size: width * 0.09),
//                 // SizedBox(width: width * 0.03),
//               ],
//             ),
//           ),

          
//           Padding(
//             padding: EdgeInsets.only(top: height * 0.35, left: width * 0.03),
//             child: Text(
//               "2025",
//               style: TextStyle(
//                 color: AppColor.primarycolor,
//                 fontSize: width * 0.09,
//               ),
//             ),
//           ),

        
//           Positioned(
//             bottom: height * 0.05,
//             left: 0,
//             right: 0,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 // Calendar
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => Calendarscreen()));
//                   },
//                   child: CircleAvatar(
//                     backgroundColor: AppColor.ternarycolor,
//                     radius: width * 0.08,
//                     child: Icon(Icons.calendar_today,
//                         color: AppColor.secondarycolor, size: width * 0.07),
//                   ),
//                 ),

                
               
//                 // Inside Positioned -> Row -> Center CircleAvatar (Add Button)

//    CircleAvatar(
//     radius: width * 0.1,
//     backgroundColor: AppColor.secondarycolor,
//     child: Icon(Icons.add,
//         color: AppColor.primarycolor, size: width * 0.08),
//   ),

//                 // Profile
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => ProfileScreen()));
//                   },
//                   child: CircleAvatar(
//                     backgroundColor: AppColor.ternarycolor,
//                     radius: width * 0.08,
//                     child: Icon(Icons.person,
//                         color: AppColor.secondarycolor, size: width * 0.07),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class TopCurveClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     path.lineTo(0, size.height * 0.8);
//     path.quadraticBezierTo(
//       size.width * 0.5, size.height, // control point
//       size.width, size.height * 0.8, // end point
//     );
//     path.lineTo(size.width, 0);
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:innerink_diary/screens/Diarypage.dart';
import 'package:intl/intl.dart';
import 'package:innerink_diary/colors/App_color.dart';
//import 'package:innerink_diary/screens/addentryscreen.dart';
import 'package:innerink_diary/screens/calendarscreen.dart';
import 'package:innerink_diary/screens/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:innerink_diary/modals/diaryentrymodal.dart';

class MainDarkScreen extends StatefulWidget {
  const MainDarkScreen({super.key});

  @override
  State<MainDarkScreen> createState() => _MainDarkScreenState();
}

class _MainDarkScreenState extends State<MainDarkScreen> {
  List<DiaryEntry> entries = [];

  @override
  void initState() {
    super.initState();
    _loadEntries();
  }

  Future<void> _loadEntries() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? savedEntries = prefs.getStringList("diary_entries");

    if (savedEntries != null) {
      setState(() {
        entries = savedEntries
            .map((e) => DiaryEntry.fromJson(json.decode(e)))
            .toList();

        // Sort latest first
        entries.sort((a, b) => DateFormat("dd MMM yyyy")
            .parse(b.date)
            .compareTo(DateFormat("dd MMM yyyy").parse(a.date)));
      });
    }
  }

  Future<void> _addEntry(DiaryEntry entry) async {
    final prefs = await SharedPreferences.getInstance();
    entries.add(entry);

    await prefs.setStringList(
      "diary_entries",
      entries.map((e) => json.encode(e.toJson())).toList(),
    );

    _loadEntries();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      
      body: 
      
      Stack(
        
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

         
          ClipPath(
            clipper: TopCurveClipper(),
            child: Container(
              height: height * 0.4,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/realphoto.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

         
          Padding(
            padding: EdgeInsets.only(top: height * 0.03, left: width * 0.03),
            child: Row(
              children: [
                Icon(Icons.settings,
                    color: AppColor.secondarycolor, size: width * 0.09),
                const Spacer(),
               
                 Icon(Icons.search,
                       color: AppColor.secondarycolor, size: width * 0.09),

                SizedBox(width: width * 0.04),
                Icon(Icons.more_vert,
                    color: AppColor.secondarycolor, size: width * 0.09),
              ],
            ),
          ),

        
          Padding(
            padding: EdgeInsets.only(top: height * 0.35),
            child: Container(
              height: height * 0.55,
              width: double.infinity,
              child: entries.isEmpty
                  ? const Center(
                      child: Text(
                        "No diary entries yet.",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    )
                  : ListView.builder(
                      itemCount: entries.length,
                      itemBuilder: (context, index) {
                        final entry = entries[index];
                        return Card(
                          margin: const EdgeInsets.all(8),
                          child: ListTile(
                            title: Text(entry.title),
                            subtitle: Text("${entry.date} • ${entry.mood}"),
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                  title: Text(entry.title),
                                  content: Text(
                                      "${entry.content}\n\nMood: ${entry.mood}"),
                                ),
                              );
                            },
                          ),
                        );
                      },
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

               
                GestureDetector(
                  onTap: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => DiaryPage()),
                    );
                    if (result != null && result is DiaryEntry) {
                      _addEntry(result);
                    }
                  },
                  child: CircleAvatar(
                    radius: width * 0.1,
                    backgroundColor: AppColor.secondarycolor,
                    child: Icon(Icons.add,
                        color: AppColor.primarycolor, size: width * 0.08),
                  ),
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
      size.width * 0.5,
      size.height, // control point
      size.width,
      size.height * 0.8, // end point
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
