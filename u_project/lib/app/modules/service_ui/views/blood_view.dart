import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:u_project/app/modules/service_ui/views/donate_tab_bar_view.dart';
import 'package:u_project/app/modules/service_ui/views/receive_tab_bar_view.dart';
import 'package:u_project/widgets/custom_text.dart';

class BloodView extends GetView {
  const BloodView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Custom_TExt(
            txt: "Blood",
            textColor: Colors.white,
            fs: 25,
            fw: FontWeight.bold,
          ),
          bottom: TabBar(
            tabs: [
              Tab(
                child: Custom_TExt(
                  txt: "Receive",
                  textColor: Colors.white,
                  fs: 20,
                  fw: FontWeight.bold,
                ),
              ),
              Tab(
                child: Custom_TExt(
                  txt: "Donate",
                  textColor: Colors.white,
                  fs: 20,
                  fw: FontWeight.bold,
                ),
              ),
            ],
          ),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
        ),
        body: TabBarView(
          children: [
            ReceiveView(),
            DonateTabBarView(),
          ],
        ),
      ),
    );
  }
}
