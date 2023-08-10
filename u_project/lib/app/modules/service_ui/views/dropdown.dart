import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:u_project/app/modules/service_ui/controllers/dropdown_controller.dart';

class DropdownPage extends StatelessWidget {
  final DropdownController dropdownController = Get.put(DropdownController());

  final List<String> dropdownItems = [
    'Option 1',
    'Option 2',
    'Option 3',
    'Option 4',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(() => DropdownButton<String>(
            value: dropdownController.selectedValue.value,
            onChanged: (value) {
              dropdownController.onItemSelected(value!);
            },
            items: dropdownItems
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    ))
                .toList(),
          )),
      // SizedBox(height: 20),
    );
  }
}
