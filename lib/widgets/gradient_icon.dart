import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class GradientIcon extends StatelessWidget {
  double size;
  final IconData icon;
  final Color startColor;
  final Color endColor;
  final Color? iconColor;
  double? radius;
  double bgSize;

  GradientIcon({
    Key? key,
    this.size = 20,
    this.radius,
    required this.bgSize,
    this.iconColor,
    required this.startColor,
    required this.endColor,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: bgSize,
      height: bgSize,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 1),
          gradient: LinearGradient(
            colors: [startColor, endColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 8,
                blurRadius: 40),
          ]),
      child: Icon(
        icon,
        size: size,
        color: iconColor,
      ),
    );
  }
}
