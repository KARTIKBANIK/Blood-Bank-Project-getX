import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AmbulanceView extends GetView {
  const AmbulanceView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AmbulanceView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AmbulanceView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
