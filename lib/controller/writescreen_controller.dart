import 'package:get/get.dart';

class WritescreenController extends GetxController{
  var selectedwrite =''.obs;

  void  selectwrite(String write)
  {
    selectedwrite.value=write;
  }
}