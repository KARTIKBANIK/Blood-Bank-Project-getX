import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:u_project/app/modules/home/views/home_view.dart';

class IntroductionScreenController extends GetxController {
  //TODO: Implement IntroductionScreenController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}

void onDone(context) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('ON_BOARDING', false);
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => const HomeView(),
    ),
  );
}
