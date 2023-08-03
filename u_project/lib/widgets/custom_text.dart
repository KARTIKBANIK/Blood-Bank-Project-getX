import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class Custom_TExt extends StatelessWidget {
  Custom_TExt({
    super.key,
    this.txt,
    this.fs,
    this.textColor,
    this.fw,
  });
  String? txt;
  double? fs;
  FontWeight? fw;
  Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      txt!,
      style: GoogleFonts.dmSans(
        color: textColor,
        fontSize: fs,
        fontWeight: fw,
      ),
    );
  }
}
