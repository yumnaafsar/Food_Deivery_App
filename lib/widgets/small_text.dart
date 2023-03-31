import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SmallText extends StatelessWidget {
  Color? color;
  double size;
  final String text;
  double height;

  SmallText({
    required this.text,
    this.color=const Color(0xFFccc7C5),
    this.size=12,
    this.height=1.2,

    super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color,
      fontSize: size,
      fontFamily: 'Roboto',
      height: height,
      ),
    );
  }
}