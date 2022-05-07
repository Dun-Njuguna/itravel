import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  double fontSize;
  final String text;
  final Color color;
  FontWeight fontWeight;

  AppText(
      {Key? key,
      required this.text,
      this.color = Colors.black,
      this.fontSize = 30,
      this.fontWeight = FontWeight.bold})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
        text,
        softWrap: true,
        style:TextStyle(color: color, fontSize: fontSize, fontWeight: fontWeight),
    );
  }
}
