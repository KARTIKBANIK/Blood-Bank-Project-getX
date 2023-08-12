// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:u_project/app/modules/service_ui/controllers/receive_model.dart';

// class ReceiveRepo extends GetxController {
//   static ReceiveRepo get instance => Get.find();
//   final _db = FirebaseFirestore.instance;

//   //Store in firestore
//   createReceive(ReceiveMOdel receive) async {
//     await _db.collection("Receive").add(receive.toJson()).whenComplete(() {
//       Get.snackbar(
//         "Success",
//         "Successfully",
//         snackPosition: SnackPosition.TOP,
//         backgroundColor: Colors.green.withOpacity(0.1),
//         colorText: Colors.black,
//       );
//     }).catchError((error, StackTrace) {
//       Get.snackbar(
//         "Error",
//         "Something went wrong. Try again",
//         snackPosition: SnackPosition.TOP,
//         backgroundColor: Colors.green.withOpacity(0.1),
//         colorText: Colors.black,
//       );
//       print("ERROR -$error");
//     });
//   }

//   //Step-2 Fetch all users OR Users Details...
//   Future<ReceiveMOdel> getReceiveDetails(String, name) async {
//     final snapshot =
//         await _db.collection("Receive").where("Name", isEqualTo: name).get();
//     final receiveData =
//         snapshot.docs.map((e) => ReceiveMOdel.fromSnapshot(e)).single;
//     return receiveData;
//   }

//   Future<List<ReceiveMOdel>> allReceivers(String, name) async {
//     final snapshot = await _db.collection("Receive").get();
//     final receiveData =
//         snapshot.docs.map((e) => ReceiveMOdel.fromSnapshot(e)).toList();
//     return receiveData;
//   }
// }
