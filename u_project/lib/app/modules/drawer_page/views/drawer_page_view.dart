import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:u_project/app/modules/drawer_page/views/Pages/drawer_aboutus_page.dart';
import 'package:u_project/app/modules/service_ui/views/blood_view.dart';

import '../controllers/drawer_page_controller.dart';

class DrawerPageView extends GetView<DrawerPageController> {
  const DrawerPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blueGrey,
            ), //BoxDecoration
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.blueGrey),
              accountName: Text(
                "Blood Bank",
                style: TextStyle(fontSize: 18),
              ),
              accountEmail: Text("mmbloodbank@gmail.com"),
              currentAccountPictureSize: Size.square(50),
              currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.bloodtype,
                    color: Colors.red,
                  ) //Text
                  ), //circleAvatar
            ), //UserAccountDrawerHeader
          ), //DrawerHeader
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text(' Home '),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.bloodtype),
            title: const Text(' Blood '),
            onTap: () {
              Get.to(
                BloodView(),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text(' About Us '),
            onTap: () {
              Get.to(
                AboutUsPage(),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.question_answer),
            title: const Text(' FAQ '),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    ); //Drawer;
  }
}
