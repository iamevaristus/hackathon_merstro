import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:merstro/lib.dart';

class MHome extends StatelessWidget {
  const MHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          CarouselSlider(
            items: maccountcards,
            options: CarouselOptions(
              autoPlay: false,
              initialPage: 0,
              viewportFraction: 0.75,
              enableInfiniteScroll: false,
            ),
          ),
          const SizedBox(height: 30),
          const MConvert(),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                child: Column(
                  children: const [
                    Icon(CupertinoIcons.arrow_2_circlepath_circle, color: MColors.white,),
                    SizedBox(height: 4),
                    MText(text: "Transfer",)
                  ],
                )
              ),
              InkWell(
                child: Column(
                  children: const [
                    Icon(CupertinoIcons.arrow_2_circlepath_circle, color: MColors.white,),
                    SizedBox(height: 4),
                    MText(text: "Transfer",)
                  ],
                )
              ),
              InkWell(
                child: Column(
                  children: const [
                    Icon(CupertinoIcons.arrow_2_circlepath_circle, color: MColors.white,),
                    SizedBox(height: 4),
                    MText(text: "Transfer",)
                  ],
                )
              )
            ],
          )
        ],
      )
    );
  }
}