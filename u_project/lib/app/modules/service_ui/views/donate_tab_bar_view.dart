import 'package:flutter/material.dart';

import 'package:get/get.dart';

class DonateTabBarView extends GetView {
  const DonateTabBarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text("POST"),
      ),
      body: Container(),
    );
  }
}
