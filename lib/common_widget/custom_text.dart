import 'package:flutter/material.dart';
import 'package:bookstore/services/styles.dart';

class CustomText extends StatelessWidget {
  final String msg;
  final double size;
  final Color color;
  final FontWeight weight;

  CustomText(
      {required this.size,
      required this.msg,
      required this.color,
      required this.weight});

  @override
  Widget build(BuildContext context) {
    return Text(msg,
        style: TextStyle(
            fontSize: size ?? 18,
            color: color ?? black,
            fontWeight: weight ?? FontWeight.normal));
  }
}
