import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReceiveView extends StatefulWidget {
  @override
  State<ReceiveView> createState() => _ReceiveViewState();
}

class _ReceiveViewState extends State<ReceiveView> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController bloodGrpController = TextEditingController();
  TextEditingController addressController = TextEditingController();

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
                  controller: nameController,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.person),
                    hintText: 'Enter your name',
                    labelText: 'Name',
                  ),
                ),
                TextFormField(
                  controller: phoneController,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.phone),
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
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.bloodtype),
                    hintText: 'Select your blood group',
                    labelText: 'Blood Group',
                  ),
                ),
                TextFormField(
                  controller: addressController,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.location_city),
                    hintText: 'Your Address',
                    labelText: 'Location',
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {},
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showBottomSheet,
        label: const Text("POST"),
      ),
      body: Container(),
    );
  }
}
