import 'package:flutter/material.dart';

class CustomContaier extends StatelessWidget {
  CustomContaier({
    super.key,
    required this.onTap,
    this.h,
    this.w,
    this.clr,
  });

  double? h;
  double? w;
  Color? clr;
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: h,
        width: w,
        color: clr,
      ),
    );
  }
}
