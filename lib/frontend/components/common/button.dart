import 'package:flutter/material.dart';
import 'package:merstro/lib.dart';

class MButton extends StatelessWidget {
  final String text;
  final Color color;
  final double width;
  final double height;
  final double borderRad;
  final bool loading;
  final Widget loader;
  final VoidCallback? onClick;
  final Color buttonColor;
  final BoxBorder? border;
  MButton({
    super.key, required this.text, this.color = MColors.white, this.width =  100, this.height = 44,
    this.borderRad = 8, this.loading = false, this.buttonColor = MColors.primary, this.onClick, this.border
  }) : loader = MLoader.fallingDot();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRad),
          color: buttonColor,
          border: border
        ),
        child: loading ? loader : Center(child: MText(text: text, color: color, align: TextAlign.center, size: 18, weight: FontWeight.w600,))
      ),
    );
  }
}

class MTextButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color textButtonColor;
  final String textButton;
  final VoidCallback? onClick;
  const MTextButton({
    super.key, required this.text, this.textColor = MColors.grey, this.textButtonColor = MColors.primary,
    required this.textButton, this.onClick
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MText(
          text: text,
          size: 16,
          color: textColor,
          weight: FontWeight.w400
        ),
        const SizedBox(width: 5),
        InkWell(
          onTap: onClick,
          child: MText(
            text: textButton,
            size: 16,
            color: textButtonColor,
            weight: FontWeight.w900
          ),
        )
      ]
    );
  }
}