// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class ReceiveMOdel {
//   final String? name;
//   final String? phone;
//   final String? dob;
//   final String? bloodGroup;
//   final String? address;
//   final String? details;

//   ReceiveMOdel({
//     this.name,
//     this.phone,
//     this.dob,
//     this.bloodGroup,
//     this.address,
//     this.details,
//   });
//   toJson() {
//     return {
//       "Name": name,
//       "Phone": phone,
//       "DateOfBirth": dob,
//       "BloodGroup": bloodGroup,
//       "Address": address,
//       "Details": details,
//     };
//   }

//   //Step 1 - Map for fetched from FIrebase to ReceiveModel....
//   factory ReceiveMOdel.fromSnapshot(
//       DocumentSnapshot<Map<String, dynamic>> document) {
//     final data = document.data()!;
//     return ReceiveMOdel(
//       name: data["Name"],
//       phone: data["Phone"],
//       dob: data["DateOfirth"],
//       bloodGroup: data["BLoodGroup"],
//       address: data["Address"],
//       details: data["Details"],
//     );
//   }
// }
