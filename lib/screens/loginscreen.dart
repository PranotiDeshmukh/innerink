import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> saveProfileData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', emailController.text.split('@')[0]); // Take part before @
    await prefs.setString('email', emailController.text);
  }

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
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Back & Title
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 25),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Sliderscreens()),
                        );
                      },
                      icon: Icon(Icons.arrow_back, color: AppColor.secondarycolor, size: 30),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: Text(
                      "Login Page",
                      style: TextStyle(color: AppColor.secondarycolor, fontSize: 25),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 40),

              // Login Image
              Image.asset("assets/images/loginimage.png"),
              const SizedBox(height: 20),

              // Email
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email_outlined),
                    hintText: "Email",
                    hintStyle: TextStyle(color: AppColor.ternarycolor),
                    filled: true,
                    fillColor: AppColor.secondarycolor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    hintText: "Password",
                    hintStyle: TextStyle(color: AppColor.ternarycolor),
                    suffixIcon: Icon(Icons.remove_red_eye),
                    fillColor: AppColor.secondarycolor,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Login Button
              ElevatedButton(
                onPressed: () async {
                  await saveProfileData();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GenderSelectionScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 145, vertical: 14),
                  backgroundColor: Colors.blue,
                ),
                child: Text(
                  "Login",
                  style: TextStyle(color: AppColor.secondarycolor, fontSize: 20),
                ),
              ),

              const SizedBox(height: 15),
              Text("OR", style: TextStyle(color: AppColor.secondarycolor)),
              const SizedBox(height: 15),
              Text(
                "Don't have any account?",
                style: TextStyle(color: const Color.fromARGB(255, 182, 180, 180), fontSize: 18),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => createAccount()),
                  );
                },
                child: const Text(
                  "Create Account",
                  style: TextStyle(color: Colors.blue, fontSize: 22),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
