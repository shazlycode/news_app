import 'package:flutter/material.dart';

class AppBarText extends StatelessWidget {
  const new({super.key, required this.text, required this.color});
  final String? text;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text!.toUpperCase(),
      style: TextStyle(color: color, fontWeight: FontWeight.bold),
    );
  }
}
