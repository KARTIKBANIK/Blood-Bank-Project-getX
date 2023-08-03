import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:u_project/app/modules/slider/views/slider_view.dart';
import 'package:u_project/widgets/custom_text.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.red,
        title: Custom_TExt(
          txt: 'Blood Bank',
          textColor: Colors.black,
          fs: 25,
          fw: FontWeight.bold,
        ),
      ),
      body: const Column(
        children: [
          Expanded(
            flex: 2,
            child: SliderView(),
          ),
          Expanded(
            flex: 4,
            child: Placeholder(),
          ),
        ],
      ),
    );
  }
}
