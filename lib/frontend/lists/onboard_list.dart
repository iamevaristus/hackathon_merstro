import 'package:flutter/material.dart';
import 'package:merstro/lib.dart';

class OnboardSlider extends StatelessWidget {
  final String image;
  final String text;
  const OnboardSlider({super.key, this.image = MImages.logo, this.text = "Merstro"});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(image),
        MText(text: text)
      ],
    );
  }
}

List<Widget> onboard = const [
  OnboardSlider(),
  OnboardSlider(),
  OnboardSlider(),
];