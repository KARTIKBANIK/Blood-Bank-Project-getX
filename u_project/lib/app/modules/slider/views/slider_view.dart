import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:u_project/widgets/custom_text.dart';
import '../controllers/slider_controller.dart';

class SliderView extends GetView<SliderController> {
  const SliderView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Custom_TExt(
            txt: "Our Activities",
            fs: 18,
            fw: FontWeight.w500,
          ),
        ),
        CarouselSlider(
          items: [
            Container(
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: const DecorationImage(
                  image: AssetImage("assets/images/slider_1.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: const DecorationImage(
                  image: AssetImage("assets/images/slider_2.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: const DecorationImage(
                  image: AssetImage("assets/images/slider_4.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
          options: CarouselOptions(
            height: 180.0,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 1000),
            viewportFraction: 0.8,
          ),
        ),
      ],
    );
  }
}
