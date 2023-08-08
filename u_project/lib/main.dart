import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

import 'app/routes/app_pages.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Firebase.initializeApp();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
