import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:merstro/lib.dart';

class MLoader extends StatelessWidget {
  final Widget child;
  final Color color;
  final double size;
  MLoader({
    super.key, this.color = MColors.white, this.size = 20}) : child = LoadingAnimationWidget.beat(color: color, size: size);
  MLoader.fallingDot({
    super.key, this.color = MColors.white, this.size = 20}) : child = LoadingAnimationWidget.fallingDot(color: color, size: size);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: child,
    );
  }
}