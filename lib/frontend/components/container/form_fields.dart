import 'package:flutter/material.dart';
import 'package:merstro/lib.dart';

class MTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final bool? enabled;
  final TextInputType? keyboard;
  final TextInputAction? inputAction;
  final bool obscure;
  final String? Function(String?)? validate;
  final String labeltext;
  final String formName;
  const MTextFormField({
    super.key,
    this.controller,
    this.enabled,
    this.keyboard,
    this.obscure = false,
    this.validate,
    required this.formName,
    required this.labeltext, this.inputAction
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MText(text: formName, size: 16, color: MColors.grey, weight: FontWeight.w500),
          const SizedBox(height: 5),
          TextFormField(
            style: MTexts.authForm(context),
            cursorColor: Theme.of(context).primaryColor,
            controller: controller,
            enabled: enabled,
            textInputAction: inputAction,
            keyboardType: keyboard,
            onChanged: (value) => debugShow(value.toString()),
            obscureText: obscure,
            validator: validate,
            decoration: InputDecoration(
              hintText: labeltext,
              hintStyle: MTexts.hints(context),
              isDense: true,
              filled: true,
              fillColor: MColors.white,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(
                  width: 2.5,
                  color: MColors.greyed,
                  style: BorderStyle.solid,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(
                  color: MColors.primary,
                  width: 2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MPasswordField extends StatelessWidget {
  final String labelText;
  final TextEditingController? controller;
  final bool enabled;
  final bool obscureText;
  final String? Function(String?)? validate;
  final VoidCallback onPressed;
  final Icon icon;
  final TextInputAction? inputAction;
  final TextInputType keyboard;
  final String formName;
  const MPasswordField({
    super.key,
    required this.labelText,
    this.controller,
    this.enabled = true,
    this.obscureText = true,
    this.validate,
    required this.onPressed,
    required this.icon,
    required this.formName,
    this.keyboard = TextInputType.text, this.inputAction
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MText(text: formName, size: 16, color: MColors.grey, weight: FontWeight.w500),
          const SizedBox(height: 5),
          TextFormField(
            style: MTexts.authForm(context),
            cursorColor: Theme.of(context).primaryColor,
            controller: controller,
            enabled: enabled,
            textInputAction: inputAction,
            keyboardType: keyboard,
            obscureText: obscureText,
            validator: validate,
            onChanged: (password){
              debugShow(password.toString());
            },
            decoration: InputDecoration(
              hintText: labelText,
              hintStyle: MTexts.hints(context),
              isDense: true,
              filled: true,
              suffixIcon: IconButton(
                onPressed: onPressed,
                icon: icon
              ),
              fillColor: MColors.white,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(
                  width: 2.5,
                  color: MColors.greyed,
                  style: BorderStyle.solid,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(
                  color: MColors.primary,
                  width: 2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}