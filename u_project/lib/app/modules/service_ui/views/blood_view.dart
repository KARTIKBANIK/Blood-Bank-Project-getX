import 'package:flutter/material.dart';

import 'package:get/get.dart';

class BloodView extends GetView {
  const BloodView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BloodView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BloodView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
