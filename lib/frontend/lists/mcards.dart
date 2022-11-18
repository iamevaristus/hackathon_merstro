import 'package:flutter/material.dart';
import 'package:merstro/lib.dart';

class MAccountCard extends StatelessWidget {
  final String image;
  final String text;
  const MAccountCard({super.key, this.image = MImages.logo, this.text = "Merstro"});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
              color: MColors.secondary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10)
              )
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const MText(text: "Virtual // USD"),
                    Image.asset(MImages.logo, width: 10,)
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(color: MColors.grey),
                          right: BorderSide(color: MColors.grey),
                          bottom: BorderSide(color: MColors.grey)
                        )
                      ),
                      child: Column(
                        children: const [
                          MText(text: "Num."),
                          SizedBox(height: 6),
                          MText(text: "0658"),
                        ],
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(color: MColors.grey),
                          left: BorderSide(color: MColors.grey),
                          bottom: BorderSide(color: MColors.grey)
                        )
                      ),
                      child: Column(
                        children: const [
                          MText(text: "Num."),
                          SizedBox(height: 6),
                          MText(text: "0658"),
                        ],
                      ),
                    ),
                  ]
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
              color: MColors.secondary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10)
              )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                MText(text: "Balance"),
                SizedBox(height: 6),
                MText(text: "\$0.00")
              ],
            ),
          )
        ],
      )
    );
  }
}

List <Widget> maccountcards = [
  MAccountCard(),
  MAccountCard(),
  MAccountCard(),
  MAccountCard(),
];