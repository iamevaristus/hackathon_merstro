import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:merstro/lib.dart';

class MLoginScreen extends StatefulWidget {
  const MLoginScreen({super.key});

  @override
  State<MLoginScreen> createState() => _MLoginScreenState();
}

class _MLoginScreenState extends State<MLoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailAddress = TextEditingController();
  TextEditingController password = TextEditingController();

  bool isLoading = false;
  bool isVisible = false;

  signin() async {
    if(!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();

    MAuthentication emailPassword = Provider.of<MAuthentication>(context, listen: false);
    emailPassword.signIn(email: emailAddress.text, password: password.text);
  }

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
                      MTextFormField(
                        formName: "Email Address",
                        labeltext: "sample@gmail.com",
                        controller: emailAddress,
                        keyboard: TextInputType.emailAddress,
                        inputAction: TextInputAction.next,
                      ),
                      const SizedBox(height: 10),
                      MPasswordField(
                        formName: "Password",
                        labelText: "Enter your strong password",
                        controller: password,
                        keyboard: TextInputType.visiblePassword,
                        inputAction: TextInputAction.done,
                        obscureText: !isVisible,
                        onPressed: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                        icon: Icon(
                          isVisible ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
                          color: MColors.greyer,
                        ),
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
                      Consumer<MAuthentication>(
                        builder: (context, emailPassword, _) {
                          return MButton(
                            text: "Log In",
                            width: width,
                            onClick: () => signin(),
                            loading: emailPassword.isLoading,
                          );
                        }
                      )
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