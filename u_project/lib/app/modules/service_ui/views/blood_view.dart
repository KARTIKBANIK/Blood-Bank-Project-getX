import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:u_project/app/modules/service_ui/views/donate_tab_bar_view.dart';
import 'package:u_project/app/modules/service_ui/views/receive_tab_bar_view.dart';
import 'package:u_project/widgets/custom_container.dart';
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

            // FetchData(),
          ],
        ),
        /*  body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 30,
                left: 15,
                right: 15,
              ),
              child: Custom_Container__2(
                onTap: () {},
                h: MediaQuery.of(context).size.height / 3.5,
                w: MediaQuery.of(context).size.width / 1,
                img: "assets/images/blood_donor.png",
                txt: "Donor",
                textColor: Colors.black,
                fs: 30,
                fw: FontWeight.bold,
                lspace: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 30,
                left: 15,
                right: 15,
              ),
              child: Custom_Container__2(
                onTap: () {},
                h: MediaQuery.of(context).size.height / 3.5,
                w: MediaQuery.of(context).size.width / 1,
                img: "assets/images/blood_receiver.png",
                txt: "Receiver",
                textColor: Colors.black,
                fs: 30,
                fw: FontWeight.bold,
                lspace: 1,
              ),
            ),
          ],
        ),
       
       */
      ),
    );
  }
}
