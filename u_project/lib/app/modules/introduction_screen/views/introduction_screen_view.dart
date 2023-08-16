import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:u_project/app/modules/home/views/home_view.dart';
import '../controllers/introduction_screen_controller.dart';

class IntroductionScreenView extends GetView<IntroductionScreenController> {
  const IntroductionScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final List<PageViewModel> pages = [
      PageViewModel(
        title: 'Connect With Everyone',
        body: 'You can reach donar over this app. And find your blood',
        image: Center(
          child: Lottie.asset("assets/animations/2.json"),
        ),
        decoration: const PageDecoration(
          titleTextStyle: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      PageViewModel(
        title: 'Have Access Everywhere!',
        body: 'You can access it all over Bangladesh',
        image: Center(
          child: Lottie.asset("assets/animations/1.json"),
        ),
        decoration: const PageDecoration(
          titleTextStyle: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      PageViewModel(
        title: 'Here We Start!',
        body: 'Give Blood Safe Life. We are always support & help you',
        image: Center(
          child: Lottie.asset("assets/animations/5.json"),
        ),
        decoration: const PageDecoration(
          titleTextStyle: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 190,
        ),
        child: IntroductionScreen(
          pages: pages,
          dotsDecorator: const DotsDecorator(
            size: Size(15, 15),
            color: Colors.blue,
            activeSize: Size.square(20),
            activeColor: Colors.red,
          ),
          showDoneButton: true,
          done: OutlinedButton(
            onPressed: () {
              Get.to(
                const HomeView(),
              );
            },
            child: const Text("Done"),
          ),
          showSkipButton: true,
          skip: const Text(
            'Skip',
            style: TextStyle(fontSize: 20),
          ),
          showNextButton: true,
          next: const Icon(
            Icons.arrow_forward,
            size: 25,
          ),
          onDone: () => onDone(context),
          curve: Curves.bounceOut,
        ),
      ),
    );
  }
}
