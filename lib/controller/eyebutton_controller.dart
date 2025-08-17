import 'package:get/get.dart';

class EyebuttonController extends GetxController{
  var eye = false.obs;

  void eyebutton()
  {
     if(eye.value  == false ){
      eye.value = true;
      }

      else{
        eye.value = false;
      }

  }  
}