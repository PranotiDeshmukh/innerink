import 'package:flutter/material.dart';
import 'package:innerink_diary/colors/App_color.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String username = "";
  String email = "";

  @override
  void initState() {
    super.initState();
    loadProfile();
  }

  Future<void> loadProfile() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username') ?? "";
      email = prefs.getString('email') ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF7B4B83), Color(0xFF3E2466)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          
         // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 18,),
              
              Row(
                
                children: [
                  SizedBox(width: 10,),
                  Icon(Icons.arrow_back,color: AppColor.secondarycolor,size: 30,),
                  SizedBox(width: 10,),
                  Text(" My Profile",style: TextStyle(color: AppColor.secondarycolor,fontSize: 22),),
                ],
              ),
              SizedBox(height: 100,),
           
            Center(
              child: const CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage('assets/images/loginimage.png'),
              ),
            ),
            const SizedBox(height: 20),
            Text("Username: $username", style: const TextStyle(fontSize: 18, color: Colors.white)),
            SizedBox(height: 20,),
            Text("Email: $email", style: const TextStyle(fontSize: 18, color: Colors.white)),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                await prefs.clear(); // logout
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 145, vertical: 14),
                  backgroundColor: Colors.blue,
              ),
              child: const Text("Logout",style: TextStyle(color: AppColor.secondarycolor),),
            ),
          ],
        ),
      ),
    );
  }
}
