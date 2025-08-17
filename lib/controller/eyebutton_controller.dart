import 'package:get/get.dart';

class EyebuttonController extends GetxController{
  var eye = true.obs;

  void eyebutton()
  {
     if(eye.value  == true ){
      eye.value = false;
      }

      else{
        eye.value = true;
      }

  }  
}