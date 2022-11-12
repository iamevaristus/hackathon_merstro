import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:merstro/lib.dart';

class MPasswordChangedScreen extends StatefulWidget {
  const MPasswordChangedScreen({super.key});

  @override
  State<MPasswordChangedScreen> createState() => _MPasswordChangedScreenState();
}

class _MPasswordChangedScreenState extends State<MPasswordChangedScreen> {
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
              const SizedBox(height: 100),
              Container(
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: MColors.greyer
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
                  child: Column(
                    children: [
                      const SizedBox(height: 60),
                      const Icon(
                        CupertinoIcons.check_mark_circled_solid,
                        color: MColors.primary,
                        size: 65
                      ),
                      const SizedBox(height: 40),
                      const MText(text: "Password Changed", color: MColors.black, size: 24, weight: FontWeight.w500),
                      const SizedBox(height: 10),
                      const MText(
                        text: "A password reset link has been sent to",
                        color: MColors.black,
                        size: 16,
                        weight: FontWeight.w400,
                        align: TextAlign.center,
                      ),
                      const SizedBox(height: 40),
                      MButton(text: "Proceed to Log In", width: width, onClick: () => Get.to(() => const MLoginScreen()),),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}