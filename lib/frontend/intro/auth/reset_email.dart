import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:merstro/lib.dart';

class MResetEmailScreen extends StatefulWidget {
  const MResetEmailScreen({super.key});

  @override
  State<MResetEmailScreen> createState() => _MResetEmailScreenState();
}

class _MResetEmailScreenState extends State<MResetEmailScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            CupertinoIcons.arrow_left,
            color: Theme.of(context).primaryColor
          )
        ),
        centerTitle: true,
        title: Image.asset(
          MImages.logo,
          height: 30,
          color: MColors.primary,
          alignment: AlignmentDirectional.center,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
          child: Column(
            children: [
              const SizedBox(height: 190),
              const MText(text: "Check your email", color: MColors.black, size: 24, weight: FontWeight.w500),
              const SizedBox(height: 10),
              const MText(
                text: "A password reset link has been sent to",
                color: MColors.black,
                size: 16,
                weight: FontWeight.w400,
                align: TextAlign.center,
              ),
              const MText(
                text: "sample@gmail.com",
                color: MColors.primary,
                size: 16,
                weight: FontWeight.w400,
                align: TextAlign.center,
              ),
              const SizedBox(height: 60),
              MButton(text: "Open Email App", width: width, onClick: () => Get.to(() => const MNewPasswordScreen()),),
              const SizedBox(height: 15),
              Center(
                child: MTextButton(
                  text: "Didn't get a link?",
                  textButton: "Click to resend",
                  onClick: () => Get.to(() => const MForgotPasswordScreen()),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}