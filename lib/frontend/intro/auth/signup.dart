import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:merstro/lib.dart';

class MSignupScreen extends StatefulWidget {
  const MSignupScreen({super.key});

  @override
  State<MSignupScreen> createState() => _MSignupScreenState();
}

class _MSignupScreenState extends State<MSignupScreen> {
  final GlobalKey _formKey = GlobalKey<FormState>();
  bool check = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      extendBodyBehindAppBar: true,
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
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const MTextFormField(
                        formName: "First Name",
                        labeltext: "Enter your first name",
                      ),
                      const SizedBox(height: 10),
                      const MTextFormField(
                        formName: "Last Name",
                        labeltext: "Enter your last name",
                      ),
                      const SizedBox(height: 10),
                      const MTextFormField(
                        formName: "Email Address",
                        labeltext: "sample@gmail.com",
                      ),
                      const SizedBox(height: 10),
                      const MTextFormField(
                        formName: "Phone Number",
                        labeltext: "+234 906 000 6765",
                      ),
                      const SizedBox(height: 10),
                      MPasswordField(
                        formName: "Password",
                        labelText: "Create a strong password",
                        onPressed: () {},
                        icon: const Icon(CupertinoIcons.eye, color: MColors.greyer)
                      ),
                      const SizedBox(height: 10),
                      const MTextFormField(
                        formName: "Referral Code (Optional)",
                        labeltext: "Enter your referral code here",
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          MText(text: "By signing up, I agree to the ", color: MColors.grey, size: 14),
                          MText(text: "Terms ", color: MColors.primary, size: 14),
                          MText(text: "and ", color: MColors.grey, size: 14),
                          MText(text: "Privacy Policy", color: MColors.primary, size: 14),
                        ],
                      ),
                      const SizedBox(height: 20),
                      MButton(text: "Create Account", width: width,)
                    ],
                  )
                ),
                const SizedBox(height: 10),
                Center(
                  child: MTextButton(
                    text: "Already have an account?",
                    textButton: "Log In",
                    onClick: () => Get.to(() => const MLoginScreen()),
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