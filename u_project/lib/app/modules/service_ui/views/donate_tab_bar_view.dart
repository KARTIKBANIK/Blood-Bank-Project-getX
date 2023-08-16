import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:u_project/app/modules/login/views/login_view.dart';

class DonateTabBarView extends GetView {
  const DonateTabBarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.redAccent,
        onPressed: () {
          Get.to(LoginView());
        },
        label: const Text("POST"),
      ),
      body: Container(),
    );
  }
}
