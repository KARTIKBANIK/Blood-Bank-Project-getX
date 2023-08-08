import 'package:flutter/material.dart';

import 'package:get/get.dart';

class FireStationView extends GetView {
  const FireStationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FireStationView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'FireStationView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
