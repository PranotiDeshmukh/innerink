import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  final formkey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();


//validation code
  String? validationemail(String? value)
  {
      if(value == null || value.isEmpty)
      {
        return " email is required ";
      }
      if(!value.contains("@")){
        return "email is invalid";
      }
      return null;
  }

  //pass validate code

 String? validatepassword(String? value)
 {
    if (value == null || value.isEmpty)
  {
    return "password is required";
  }
  if(value.length < 8)
  {
       return "password must be of 8 characters";
  }
  return null;

 }
}