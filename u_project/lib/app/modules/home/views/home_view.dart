import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:u_project/app/modules/drawer_page/views/drawer_page_view.dart';
import 'package:u_project/app/modules/search/views/search_view.dart';
import 'package:u_project/app/modules/service_ui/views/service_ui_view.dart';
import 'package:u_project/app/modules/slider/views/slider_view.dart';
import 'package:u_project/widgets/custom_text.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerPageView(),
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
        actions: [
          IconButton(
            onPressed: () {
              Get.to(
                SearchScrrren(),
              );
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: SliderView(),
          ),
          Expanded(
            flex: 4,
            child: ServiceUiView(),
          ),
        ],
      ),
    );
  }
}
