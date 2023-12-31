import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:u_project/app/modules/service_ui/views/firebase_/update_data.dart';
import 'package:u_project/app/modules/signup/bindings/signup_binding.dart';
import 'package:u_project/widgets/custom_text.dart';
import 'package:url_launcher/url_launcher.dart';

class ReceiveView extends StatefulWidget {
  DatabaseReference dbRef = FirebaseDatabase.instance.ref().child('Receive');

  @override
  State<ReceiveView> createState() => _ReceiveViewState();
}

class _ReceiveViewState extends State<ReceiveView> {
  //delete  instance

  late DatabaseReference dbRef;
  DatabaseReference reference =
      FirebaseDatabase.instance.ref().child("Receive");
  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('Receive');
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  late TextEditingController _dateController =
      TextEditingController(text: parsedDate.toString());
  TextEditingController bloodGrpController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController detailsController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  // String name = '';

//BLood Donating
  DateTime? _selectedDate;
  DateTime parsedDate = DateFormat('yyyy-MM-dd').parse('2023-08-16');

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = _selectedDate.toString(); // Format as needed
      });
    }
  }

  void _showBottomSheet() {
    Get.bottomSheet(
      Container(
        height: 400,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Form(
            key: formKey,
            child: ListView(
              children: <Widget>[
                TextFormField(
                  keyboardType: TextInputType.name,
                  controller: nameController,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp(r"[a-zA-Z]+|\s"),
                    )
                  ],
                  validator: (val) {
                    if (!val!.isValidName) return 'Enter valid name';
                    return null;
                  },
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: 'Enter your name',
                    labelText: 'Name',
                  ),
                ),
                TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp(r"[0-9]"),
                    )
                  ],
                  validator: (val) {
                    if (!val!.isValidPhone) {
                      return 'Enter valid phone';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    icon: Icon(Icons.phone),
                    hintText: 'Enter a phone number',
                    labelText: 'Phone',
                  ),
                ),
                TextFormField(
                  controller: _dateController,
                  onTap: () => _selectDate(context),
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        _selectDate(context);
                      },
                      icon: Icon(Icons.calendar_month),
                    ),
                    icon: const Icon(Icons.calendar_today),
                    hintText: 'Enter Blood Donating Date',
                    labelText: 'Blood Donating Date',
                  ),
                ),
                TextFormField(
                  controller: bloodGrpController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.bloodtype),
                    hintText: 'Select your blood group',
                    labelText: 'Blood Group',
                  ),
                ),
                TextFormField(
                  controller: addressController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.pin_drop),
                    icon: Icon(Icons.location_city),
                    hintText: 'Your Address',
                    labelText: 'Location',
                  ),
                ),
                TextFormField(
                  controller: detailsController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.info_outline),
                    hintText: 'Write tell about pataints details',
                    labelText: 'Deails',
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    Fluttertoast.showToast(
                      msg: "Post Successfully",
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 3,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 13,
                    );
                    Map<String, String> Receive = {
                      'name': nameController.text,
                      'phone': phoneController.text,
                      'bdd': _dateController.text,
                      'blood-group': bloodGrpController.text,
                      'location': addressController.text,
                      'detils': detailsController.text,
                    };

                    dbRef.push().set(Receive);
                    navigator!.pop();

                    //Add the data to the database....
                    FirebaseFirestore.instance
                        .collection("receive_list")
                        .add(Receive)
                        .then((value) {
                      nameController.clear();
                      addressController.clear();
                      _dateController.clear();
                      phoneController.clear();
                      bloodGrpController.clear();
                      detailsController.clear();
                    });
                  },
                  icon: Icon(Icons.post_add_rounded),
                  label: Text("Submit"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget listItem({required Map receive}) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height / 5,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 228, 236, 243),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: .1,
          color: Colors.black,
        ),
      ),
      child: ListView(
        children: [
          ListTile(
            onTap: () {
              print("helllooooooooooooooooooo");
            },
            trailing: CircleAvatar(
              radius: 26,
              backgroundColor: Colors.grey,
              child: GestureDetector(
                onTap: () {},
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.call),
                ),
              ),
            ),
            leading: CircleAvatar(
              radius: 26,
              backgroundColor: Colors.grey,
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.white,
                child: Text(
                  receive['blood-group'],
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  receive['name'],
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Donate Date: ${receive['bdd']}",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent,
                  ),
                ),
                Text(
                  "Contact: ${receive['phone']}",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  "Address : ${receive['location']}",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.blueGrey,
                  ),
                ),
                Text(
                  "Details: ${receive['detils']}",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.blueGrey,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 94, 180,
                      99), // Change this color to your desired color
                ),
                onPressed: () {
                  Get.to(Updateecord(receiveKey: receive["key"]));
                },
                icon: Icon(Icons.update),
                label: Text("Update"),
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 247, 114,
                      114), // Change this color to your desired color
                ),
                onPressed: () {
                  reference.child(receive["key"]).remove();
                  Fluttertoast.showToast(
                    msg: "Successfully Deleted",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 3,
                    backgroundColor: Colors.redAccent,
                    textColor: Colors.white,
                    fontSize: 13,
                  );
                },
                icon: Icon(Icons.delete_forever),
                label: Text("Delete"),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showBottomSheet,
        backgroundColor: Colors.redAccent,
        label: Custom_TExt(
          txt: "POST",
          fs: 16,
          fw: FontWeight.bold,
        ),
      ),
      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: dbRef,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            Map receive = snapshot.value as Map;
            receive['key'] = snapshot.key;
            onCall(int index) async {
              String phoneNumber = receive['phone'];
              final url = 'tel:$phoneNumber';
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            }

            return Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height / 5,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 228, 236, 243),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: .1,
                  color: Colors.black,
                ),
              ),
              child: ListView(
                children: [
                  ListTile(
                    onTap: () {
                      print("helllooooooooooooooooooo");
                    },
                    trailing: CircleAvatar(
                      radius: 26,
                      backgroundColor: Colors.grey,
                      child: GestureDetector(
                        onTap: () {
                          onCall(index);
                        },
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.call),
                        ),
                      ),
                    ),
                    leading: CircleAvatar(
                      radius: 26,
                      backgroundColor: Colors.grey,
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.white,
                        child: Text(
                          receive['blood-group'],
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          receive['name'],
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Donate Date: ${receive['bdd']}",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.redAccent,
                          ),
                        ),
                        Text(
                          "Contact: ${receive['phone']}",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          "Address : ${receive['location']}",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.blueGrey,
                          ),
                        ),
                        Text(
                          "Details: ${receive['detils']}",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 94, 180,
                              99), // Change this color to your desired color
                        ),
                        onPressed: () {
                          Get.to(Updateecord(receiveKey: receive["key"]));
                        },
                        icon: Icon(Icons.update),
                        label: Text("Update"),
                      ),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 247, 114,
                              114), // Change this color to your desired color
                        ),
                        onPressed: () {
                          reference.child(receive["key"]).remove();
                          Fluttertoast.showToast(
                            msg: "Successfully Deleted",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 3,
                            backgroundColor: Colors.redAccent,
                            textColor: Colors.white,
                            fontSize: 13,
                          );
                        },
                        icon: Icon(Icons.delete_forever),
                        label: Text("Delete"),
                      ),
                    ],
                  )
                ],
              ),
            );

            // return listItem(receive: receive);
          },
        ),
      ),
    );
  }

  void updateDocument() async {
    await Firebase.initializeApp();

    // Reference to the document you want to update
    DocumentReference docRef =
        FirebaseFirestore.instance.collection('receive_list').doc('documentId');

    // Update a specific field
    docRef.update({
      'name': nameController.text,
      'phone': phoneController.text,
      'bdd': _dateController.text,
      'blood-group': bloodGrpController.text,
      'location': addressController.text,
      'detils': detailsController.text,
    });
  }
}
