import 'package:get/get.dart';

class DropdownController extends GetxController {
  var selectedValue = ''.obs;

  void onItemSelected(String value) {
    selectedValue.value = value;
  }
}
