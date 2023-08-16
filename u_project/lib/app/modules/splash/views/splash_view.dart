import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:u_project/app/modules/home/views/home_view.dart';
import 'package:u_project/app/modules/introduction_screen/views/introduction_screen_view.dart';
import 'package:u_project/widgets/custom_text.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  void initState() {
    super.initState();
    // Simulate some loading process or async initialization here
    Future.delayed(Duration(seconds: 3), () {
      // Navigate to the next screen after the splash screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => IntroductionScreenView(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Image.asset("assets/images/splash.png"),
          ),
          Custom_TExt(
            txt: "Blood Donation App",
            fw: FontWeight.bold,
            fs: 30,
          )
        ],
      ),
    );
  }
}
