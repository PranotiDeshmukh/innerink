import 'package:get/get.dart';

class AgegroupController extends GetxController
{
   var selectedAge = ''.obs;

   void selectagegroup(String Age)
   {
    selectedAge.value = Age;
   }
}