import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innerink_diary/controller/eyebutton_controller.dart';
import 'package:innerink_diary/controller/login_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:innerink_diary/colors/App_color.dart';
import 'package:innerink_diary/screens/create_account.dart';
import 'package:innerink_diary/screens/genderselectionscreen.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final EyebuttonController eyebutton = Get.put(EyebuttonController());
  final LoginController login_Controller = Get.put(LoginController());

  Future<void> saveProfileData() async {
    final prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    // ✅ MediaQuery sizes
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1F1F66),
              Color(0xFF3F3F8F),
              Color(0xFF6B3F75),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Form(
            key: login_Controller.formkey,
            child: Column(
              children: [
                // Back & Title
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: width * 0.03, top: height * 0.04),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back, color: AppColor.secondarycolor, size: width * 0.08),
                      ),
                    ),
                    SizedBox(width: width * 0.05),
                    Padding(
                      padding: EdgeInsets.only(top: height * 0.04),
                      child: Text(
                        "Login Page",
                        style: TextStyle(
                          color: AppColor.secondarycolor,
                          fontSize: width * 0.06,
                        ),
                      ),
                    )
                  ],
                ),

                SizedBox(height: height * 0.05),

                // Login Image
                Image.asset(
                  "assets/images/loginimage.png",
                  height: height * 0.25,
                  width: width * 0.6,
                  fit: BoxFit.contain,
                ),

                SizedBox(height: height * 0.03),

                // Email
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                  child: TextFormField(
                    controller: login_Controller.emailController,
                    validator: login_Controller.validationemail,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email_outlined),
                      hintText: "Email",
                      hintStyle: TextStyle(color: AppColor.ternarycolor),
                      filled: true,
                      fillColor: AppColor.secondarycolor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(width * 0.02),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: height * 0.02),

                // Password
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                  child: Obx(
                    () => TextFormField(
                      controller: login_Controller.passwordController,
                      validator: login_Controller.validatepassword,
                      obscureText: eyebutton.eye == false ? true : false,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        hintText: "Password",
                        hintStyle: TextStyle(color: AppColor.ternarycolor),
                        suffixIcon: IconButton(
                          onPressed: () {
                            eyebutton.eyebutton();
                          },
                          icon: Icon(
                            eyebutton.eye == false ?  Icons.visibility_off : Icons.remove_red_eye,
                          ),
                        ),
                        fillColor: AppColor.secondarycolor,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(width * 0.02),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: height * 0.04),

                // Login Button
                ElevatedButton(
                  onPressed: () async {
                    if (login_Controller.formkey.currentState!.validate()) {
                      await saveProfileData();

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Login Successfully !!🎉",
                            style: const TextStyle(color: Color.fromARGB(255, 7, 241, 15)),
                          ),
                          backgroundColor: AppColor.secondarycolor,
                        ),
                      );

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GenderSelectionScreen()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text(
                            "Please fill all fields correctly ",
                            style: TextStyle(color: Colors.red),
                          ),
                          backgroundColor: AppColor.secondarycolor,
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.35,
                      vertical: height * 0.02,
                    ),
                    backgroundColor: Colors.blue,
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(color: AppColor.secondarycolor, fontSize: width * 0.05),
                  ),
                ),

                SizedBox(height: height * 0.02),

                Text("OR", style: TextStyle(color: AppColor.secondarycolor, fontSize: width * 0.04)),

                SizedBox(height: height * 0.02),

                Text(
                  "Don't have any account?",
                  style: TextStyle(color: const Color.fromARGB(255, 182, 180, 180), fontSize: width * 0.045),
                ),

                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => createAccount()));
                  },
                  child: Text(
                    "Create Account",
                    style: TextStyle(color: Colors.blue, fontSize: width * 0.055),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
