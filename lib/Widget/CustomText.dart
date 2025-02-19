import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double textsize;
  final Color color;
  final double letterSpacing;
  final FontWeight fontWeight;
  const CustomText(
      {super.key,
      required this.text,
      required this.textsize,
      required this.color,
      required this.letterSpacing,
      required this.fontWeight});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      // textAlign: TextAlign.center,
      style: TextStyle(
          color: color,
          fontSize: textsize,
          letterSpacing: letterSpacing == 0 ? 0.10 : letterSpacing,
          fontWeight: fontWeight == 0 ? FontWeight.w400 : fontWeight),
    );
  }
}
