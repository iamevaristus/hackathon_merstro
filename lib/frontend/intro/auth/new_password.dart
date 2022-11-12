import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:merstro/lib.dart';

class MNewPasswordScreen extends StatefulWidget {
  const MNewPasswordScreen({super.key});

  @override
  State<MNewPasswordScreen> createState() => _MNewPasswordScreenState();
}

class _MNewPasswordScreenState extends State<MNewPasswordScreen> {
  final GlobalKey _formKey = GlobalKey<FormState>();
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
              const SizedBox(height: 90),
              const MText(text: "New Password", color: MColors.black, size: 24, weight: FontWeight.w500),
              const SizedBox(height: 10),
              const MText(
                text: "Enter your new password. It must contain One Uppercase, One Lowercase, One Number and One Specialcase Character",
                color: MColors.black,
                size: 16,
                weight: FontWeight.w400,
                align: TextAlign.center,
              ),
              const SizedBox(height: 50),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    MPasswordField(
                      formName: "New Password",
                      labelText: "Create a strong password",
                      onPressed: () {},
                      icon: const Icon(CupertinoIcons.eye, color: MColors.greyer)
                    ),
                    const SizedBox(height: 10),
                    MPasswordField(
                      formName: "Confirm Password",
                      labelText: "Confirm your strong password",
                      onPressed: () {},
                      icon: const Icon(CupertinoIcons.eye, color: MColors.greyer)
                    ),
                  ],
                )
              ),
              const SizedBox(height: 50),
              MButton(text: "Reset Password", width: width, onClick: () => Get.to(() => const MPasswordChangedScreen()),),
              const SizedBox(height: 15),
              Center(
                child: MTextButton(
                  text: "Having trouble?",
                  textButton: "Contact support",
                  onClick: () => {},
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}