import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:u_project/widgets/custom_text.dart';

class Updateecord extends StatefulWidget {
  const Updateecord({super.key, required this.receiveKey});

  final String receiveKey;

  @override
  State<Updateecord> createState() => _UpdateecordState();
}

class _UpdateecordState extends State<Updateecord> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController bloodGrpController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  late DatabaseReference dbRef;

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('Receive');
    getReceiveData();
  }

  void getReceiveData() async {
    DataSnapshot snapshot = (await dbRef.child(widget.receiveKey).get());
    Map receive = snapshot.value as Map;

    nameController.text = receive['name'];
    phoneController.text = receive['phone'];
    _dateController.text = receive['bdd'];
    bloodGrpController.text = receive["blood-group"];
    addressController.text = receive["location"];
    detailsController.text = receive["detils"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Form(
          child: ListView(
            children: <Widget>[
              Custom_TExt(
                txt: "Update Your Data",
                fs: 25,
                fw: FontWeight.bold,
              ),
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
                  hintText: 'Blood Donating Date',
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
                    msg: "Successfully Updated",
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

                  dbRef.child(widget.receiveKey).update(Receive);
                  Navigator.pop(context);
                },
                icon: Icon(Icons.update),
                label: Text("Update"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
