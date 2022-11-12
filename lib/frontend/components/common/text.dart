import 'package:flutter/material.dart';
import 'package:merstro/lib.dart';

class MText extends StatelessWidget {
  final String text;
  final TextAlign align;
  final Color color;
  final double size;
  final FontWeight weight;
  const MText({
    super.key, required this.text, this.align = TextAlign.left, this.color = MColors.white, this.size = 14, this.weight = FontWeight.normal
  });
  const MText.theme({
    super.key, required this.text, this.align = TextAlign.left, required this.color, this.size = 14, this.weight = FontWeight.normal
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: weight
      ),
    );
  }
}