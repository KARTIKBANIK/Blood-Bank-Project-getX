import 'package:flutter/material.dart';

import 'package:get/get.dart';

class FireStationView extends GetView {
  FireStationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 5,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  child: Image.asset("assets/images/fire_services_bannar.jpg"),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  child: Image.asset("assets/images/fire.2.png"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
