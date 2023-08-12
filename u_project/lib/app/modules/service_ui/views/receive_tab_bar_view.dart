import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:u_project/widgets/custom_text.dart';

class ReceiveView extends StatefulWidget {
  Query dbRef = FirebaseDatabase.instance.ref().child('Receive');
  DatabaseReference reference =
      FirebaseDatabase.instance.ref().child('Receive');
  @override
  State<ReceiveView> createState() => _ReceiveViewState();
}

class _ReceiveViewState extends State<ReceiveView> {
  // final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController bloodGrpController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  late DatabaseReference dbRef;

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('Receive');
  }

  DateTime? _selectedDate;
  DateTime currentDate = DateTime.now();
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
            child: ListView(
              children: <Widget>[
                TextFormField(
                  keyboardType: TextInputType.name,
                  controller: nameController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: 'Enter your name',
                    labelText: 'Name',
                  ),
                ),
                TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.number,
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
                    hintText: 'Enter your date of birth',
                    labelText: 'Date of Birth',
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
                    Map<String, String> Receive = {
                      'name': nameController.text,
                      'phone': phoneController.text,
                      'dob': _dateController.text,
                      'blood-group': bloodGrpController.text,
                      'location': addressController.text,
                      'detils': detailsController.text,
                    };

                    dbRef.push().set(Receive);
                    navigator!.pop();
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

  Widget listItem({required Map donor}) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 110,
      color: Colors.amberAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            donor['name'],
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            donor['blood-group'],
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            donor['dob'],
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            donor['phone'],
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  /* Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => UpdateRecord(
                        donorKey: donor['key'],
                      ),
                    ),
                  );*/
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.edit,
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              GestureDetector(
                onTap: () {
                  // reference.child(donor['key']).remove();
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.delete,
                      color: Colors.red[700],
                    ),
                  ],
                ),
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
            Map donor = snapshot.value as Map;
            donor['key'] = snapshot.key;

            return listItem(donor: donor);
          },
        ),
      ),

      /*Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Custom_TExt(
                txt: "Request For Blood",
                fs: 23,
                fw: FontWeight.bold,
              ),
            ),
            Expanded(
              flex: 10,
              child: Container(
                child: ListView(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 5.5,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 1,
                          color: Colors.grey,
                        ),
                      ),
                      child: Column(children: [
                        ListTile(
                          leading: CircleAvatar(
                            radius: 26,
                            backgroundColor: Colors.black,
                            child: CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.white,
                              child: Custom_TExt(
                                txt: "A+",
                                textColor: Colors.red,
                                fs: 18,
                                fw: FontWeight.bold,
                              ),
                            ),
                          ),
                          title: Text('Card Title'),
                          subtitle: Text('Card Subtitle'),
                        ),
                        ButtonBar(
                          children: <Widget>[
                            ElevatedButton.icon(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                primary: Colors.green, // Background color
                              ),
                              icon: Icon(Icons.call),
                              label: Text("Call"),
                            ),
                            ElevatedButton.icon(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blueGrey, // Background color
                              ),
                              icon: Icon(Icons.info),
                              label: Text("Details"),
                            ),
                          ],
                        ),
                      ]),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(),
            ),
          ],
        ),
      ),*/
    );
  }
}
