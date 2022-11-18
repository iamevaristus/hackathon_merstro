import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:merstro/lib.dart';
import 'package:provider/provider.dart';

class MSignupScreen extends StatefulWidget {
  const MSignupScreen({super.key});

  @override
  State<MSignupScreen> createState() => _MSignupScreenState();
}

class _MSignupScreenState extends State<MSignupScreen> {
  final _formKey = GlobalKey<FormState>();
  bool check = false;
  bool visible = false;

  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController emailAddress = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController refCode = TextEditingController();

  signup() async {
    if(_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();
    MAuthentication emailPassword = Provider.of<MAuthentication>(context, listen: false);
    emailPassword.signUp(
      email: emailAddress.text,
      password: password.text,
      phoneNumber: phoneNumber.text,
      refCode: refCode.text,
      firstName: firstName.text,
      lastName: lastName.text
    );
    Navigator.of(context).push(MKYC.route(firstName.text, lastName.text, emailAddress.text, emailAddress.text));
    // if(_formKey.currentState!.validate()){
    //   return;
    // } else {
    //   _formKey.currentState!.save();
      // setState(() {
      //   createUser = ExternalFunction().postUser(
      //     path: postUser,
      //     email: emailAddress.text,
      //     firstName: firstName.text,
      //     lastName: lastName.text,
      //     phone: phoneNumber.text,
      //     password: password.text,
      //     refCode: refCode.text
      //   );
      // });
    //   Get.to(() => const MKYC());
    // }
  }

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
                      MTextFormField(
                        formName: "First Name",
                        labeltext: "Enter your first name",
                        controller: firstName,
                        validate: Validate.name,
                        keyboard: TextInputType.name,
                      ),
                      const SizedBox(height: 10),
                      MTextFormField(
                        formName: "Last Name",
                        labeltext: "Enter your last name",
                        controller: lastName,
                        validate: Validate.name,
                        keyboard: TextInputType.name,
                      ),
                      const SizedBox(height: 10),
                      MTextFormField(
                        formName: "Email Address",
                        labeltext: "sample@gmail.com",
                        controller: emailAddress,
                        validate: Validate.email,
                        keyboard: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 10),
                      MTextFormField(
                        formName: "Phone Number",
                        labeltext: "+234 906 000 6765",
                        controller: phoneNumber,
                        validate: Validate.phone,
                        keyboard: TextInputType.phone,
                      ),
                      const SizedBox(height: 10),
                      MPasswordField(
                        formName: "Password",
                        labelText: "Create a strong password",
                        onPressed: () => setState(() => visible = !visible),
                        controller: password,
                        obscureText: visible,
                        validate: Validate.password,
                        keyboard: TextInputType.visiblePassword,
                        icon: Icon(visible ? CupertinoIcons.eye : CupertinoIcons.eye_slash, color: MColors.greyer)
                      ),
                      const SizedBox(height: 10),
                      MTextFormField(
                        formName: "Referral Code (Optional)",
                        labeltext: "Enter your referral code here",
                        controller: refCode,
                        keyboard: TextInputType.text,
                      ),
                      const SizedBox(height: 20),
                      Wrap(
                        children: const [
                          MText(text: "By signing up, I agree to the ", color: MColors.grey, size: 14),
                          MText(text: "Terms ", color: MColors.primary, size: 14),
                          MText(text: "and ", color: MColors.grey, size: 14),
                          MText(text: "Privacy Policy", color: MColors.primary, size: 14),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Consumer<MAuthentication>(
                        builder: (context, emailPassword, _) {
                          return MButton(
                            text: "Create Account",
                            width: width,
                            onClick: () => signup(),
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