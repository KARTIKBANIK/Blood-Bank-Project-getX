import 'package:flutter/material.dart';

import 'package:get/get.dart';

class PoliceView extends GetView {
  const PoliceView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PoliceView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PoliceView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
