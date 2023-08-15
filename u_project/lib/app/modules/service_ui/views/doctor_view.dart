import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class DoctorView extends GetView {
  DoctorView({Key? key}) : super(key: key);

  void onCall(int index) async {
    String phoneNumber = phone[index];
    final url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  final List<String> phone = [
    "+88 01862131292",
    "+88 01761254478",
    "+88 01811479654",
    "+88 01362887924",
    "+88 01925577789",
    "+88 01854778952",
    "+88 01745887933",
    "+88 01862131295",
  ];
  var name = [
    "Dr. Partha Dev Roy",
    "Dr. Pulak Nath Banik",
    "Dr. Jahid Hasan",
    "Dr. Musa Ibrahim",
    "Dr. Anamul Hasib",
    "Dr. Lucky Begum",
    "Dr. Jillur Rahman",
    "Dr. Sahbuddin Islam",
  ];
  var specialist = [
    "Medichine Speacialist",
    "Scin Speacialist",
    "Gyney Speacialist",
    "Kydney Speacialist",
    "Heart Speacialist",
    "Child Speacialist",
    "Child Speacialist",
    "Kydney Speacialist",
    "Medichine Speacialist",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text('Doctor'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Lottie.asset("assets/animations/doctor.json"),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: .7,
                    color: Colors.black,
                  ),
                ),
                child: ListView.builder(
                  itemCount: name.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 2,
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.blueGrey,
                            child: Icon(
                              Icons.person,
                            ),
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                name[index],
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                specialist[index],
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                            ],
                          ),
                          subtitle: Text(
                            "Phone: ${phone[index]}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          trailing: IconButton(
                              onPressed: () => onCall(index),
                              icon: Icon(
                                Icons.call,
                                color: Colors.lightGreen,
                              )),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
