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
      final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 AppBar Row
            Padding(
              padding: EdgeInsets.only(left: width * 0.03, top: height * 0.04),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.arrow_back,
                      color: AppColor.secondarycolor,
                      size: width * 0.08,
                    ),
                  ),
                  SizedBox(width: width * 0.04),
                  Text(
                    "Create Account",
                    style: TextStyle(
                      color: AppColor.secondarycolor,
                      fontSize: width * 0.06,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: height * 0.1),

            // 🔹 Username
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.account_box),
                  hintText: "Username",
                  filled: true,
                  fillColor: AppColor.secondarycolor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.02),

            // 🔹 Email
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.mail_outlined),
                  hintText: "Email",
                  filled: true,
                  fillColor: AppColor.secondarycolor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.02),

            // 🔹 Password
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock),
                  hintText: "Password",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            SizedBox(height: height * 0.04),

            // 🔹 Buttons Row
            Padding(
              padding: EdgeInsets.only(left: width * 0.05),
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.symmetric(
                        vertical: height * 0.015,
                        horizontal: width * 0.12,
                      ),
                    ),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: AppColor.secondarycolor,
                        fontSize: width * 0.05,
                      ),
                    ),
                  ),
                  SizedBox(width: width * 0.06),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: height * 0.015,
                        horizontal: width * 0.12,
                      ),
                      backgroundColor: AppColor.secondarycolor,
                    ),
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: width * 0.05,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}