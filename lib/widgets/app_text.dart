import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  double size;
  final String text;
  final Color color;
  final FontWeight weight;

  AppText({
    Key? key,
    this.size = 24,
    required this.text,
    this.color = Colors.black54,
    this.weight = FontWeight.w400,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: size, fontWeight: weight,),
    );
  }
}
