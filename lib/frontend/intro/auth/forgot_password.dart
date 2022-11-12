import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:merstro/lib.dart';

class MForgotPasswordScreen extends StatefulWidget {
  const MForgotPasswordScreen({super.key});

  @override
  State<MForgotPasswordScreen> createState() => _MForgotPasswordScreenState();
}

class _MForgotPasswordScreenState extends State<MForgotPasswordScreen> {
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
              const MText(text: "Forgot Password?", color: MColors.black, size: 24, weight: FontWeight.w500),
              const SizedBox(height: 10),
              const MText(
                text: "No worries, input your email address below, we’ll send you reset instructions.",
                color: MColors.black,
                size: 16,
                weight: FontWeight.w400,
                align: TextAlign.center,
              ),
              const SizedBox(height: 50),
              Form(
                key: _formKey,
                child: const MTextFormField(
                  formName: "Email Address",
                  labeltext: "sample@gmail.com",
                ),
              ),
              const SizedBox(height: 50),
              MButton(text: "Reset Password", width: width, onClick: () => Get.to(() => const MResetEmailScreen()),)
            ],
          ),
        ),
      ),
    );
  }
}