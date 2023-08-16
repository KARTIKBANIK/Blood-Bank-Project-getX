import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:u_project/app/modules/service_ui/views/ambulance_view.dart';
import 'package:u_project/app/modules/service_ui/views/blood_view.dart';
import 'package:u_project/app/modules/service_ui/views/doctor_view.dart';
import 'package:u_project/app/modules/service_ui/views/fire_station_view.dart';
import 'package:u_project/widgets/custom_text.dart';

import '../controllers/service_ui_controller.dart';

class ServiceUiView extends GetView<ServiceUiController> {
  const ServiceUiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Custom_TExt(
              txt: "Our Services",
              fs: 18,
              fw: FontWeight.w500,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 100,
            ),
            Container(
              height: MediaQuery.of(context).size.height / 7,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(
                              BloodView(),
                            );
                          },
                          child: SizedBox(
                            height: 50,
                            width: 50,
                            child: Image.asset("assets/icons/blood.png",
                                fit: BoxFit.cover),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Custom_TExt(
                          txt: "Blood",
                          fs: 18,
                          fw: FontWeight.bold,
                          textColor: Colors.black,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 30.0,
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(
                              AmbulanceView(),
                            );
                          },
                          child: SizedBox(
                            height: 50,
                            width: 50,
                            child: Image.asset("assets/icons/ambulance.png",
                                fit: BoxFit.cover),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Custom_TExt(
                          txt: "Ambulance",
                          fs: 18,
                          fw: FontWeight.bold,
                          textColor: Colors.black,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 30.0,
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(
                              DoctorView(),
                            );
                          },
                          child: SizedBox(
                            height: 50,
                            width: 50,
                            child: Image.asset("assets/icons/doctor.png",
                                fit: BoxFit.cover),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Custom_TExt(
                          txt: "Doctor",
                          fs: 18,
                          fw: FontWeight.bold,
                          textColor: Colors.black,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 30.0,
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(
                              FireStationView(),
                            );
                          },
                          child: SizedBox(
                            height: 50,
                            width: 50,
                            child: Image.asset("assets/icons/fire.png",
                                fit: BoxFit.cover),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Custom_TExt(
                          txt: "Fire Service",
                          fs: 18,
                          fw: FontWeight.bold,
                          textColor: Colors.black,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 15,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(7),
              child: Container(
                height: MediaQuery.of(context).size.height / 5,
                width: double.infinity,
                child: Image.asset(
                  "assets/images/banner.jpg",
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
