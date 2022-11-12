import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:merstro/lib.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MOnboardScreen extends StatelessWidget {
  const MOnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int slider = 0;
    final onboarding = onboard;
    final width = MediaQuery.of(context).size.width;
    final CarouselController controller = CarouselController();
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
          child: Column(
            children: [
              Image.asset(
                MImages.logo,
                height: 30,
                color: MColors.primary,
                alignment: AlignmentDirectional.center,
              ),
              const SizedBox(height: 30),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CarouselSlider(
                      items: onboarding,
                      carouselController: controller,
                      options: CarouselOptions(
                        autoPlay: true,
                        initialPage: 0,
                        viewportFraction: 0.75,
                        enableInfiniteScroll: true,
                        autoPlayInterval: const Duration(milliseconds: 2000)
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              AnimatedSmoothIndicator(
                activeIndex: slider,
                count: onboarding.length,
                effect: const ExpandingDotsEffect(
                  activeDotColor: MColors.primary,
                  dotColor: MColors.greyer,
                  dotHeight: 10.0,
                  dotWidth: 10.0
                ),
              ),
              const SizedBox(height: 40),
              MButton(
                text: "Create Account",
                width: width,
                onClick: () => Get.to(() => const MSignupScreen()),
              ),
              const SizedBox(height: 20),
              MButton(
                text: "Log In",
                width: width,
                onClick: () => Get.to(() => const MLoginScreen()),
                buttonColor: MColors.white,
                color: MColors.primary,
                border: Border.all(color: MColors.primary),
              ),
              const SizedBox(height: 40),
            ],
          ),
        )
      ),
    );
  }
}