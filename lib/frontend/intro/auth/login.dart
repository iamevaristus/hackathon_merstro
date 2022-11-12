import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:merstro/lib.dart';

class MLoginScreen extends StatefulWidget {
  const MLoginScreen({super.key});

  @override
  State<MLoginScreen> createState() => _MLoginScreenState();
}

class _MLoginScreenState extends State<MLoginScreen> {
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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
            child: Column(
              children: [
                const SizedBox(height: 250),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const MTextFormField(
                        formName: "Email Address",
                        labeltext: "sample@gmail.com",
                      ),
                      const SizedBox(height: 10),
                      MPasswordField(
                        formName: "Password",
                        labelText: "Enter your strong password",
                        onPressed: () {},
                        icon: const Icon(CupertinoIcons.eye, color: MColors.greyer)
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () => Get.to(() => const MForgotPasswordScreen()),
                            child: const MText(text: "Forgot Password?", color: MColors.primary, size: 16, weight: FontWeight.w800)
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      MButton(text: "Log In", width: width,)
                    ],
                  )
                ),
                const SizedBox(height: 10),
                Center(
                  child: MTextButton(
                    text: "New to Merstro?",
                    textButton: "Create an account",
                    onClick: () => Get.to(() => const MSignupScreen()),
                  )
                )
              ]
            ),
          ),
        ),
      )
    );
  }
}