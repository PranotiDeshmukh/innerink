import 'package:get/get.dart';

class KeepdiaryController extends GetxController{
  var selectedkeepdiary = ''.obs;

  void selectkeepdiary(String write)
  {
    selectedkeepdiary.value = write;
  }
}