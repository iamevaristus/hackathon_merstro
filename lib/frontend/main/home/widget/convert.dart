import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:merstro/lib.dart';

class MConvert extends StatelessWidget {
  const MConvert({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          color: MColors.secondary,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          children: [
            const MTextFormField(
              formName: "Enter Amount",
              labeltext: "\$0.00"
            ),
            const SizedBox(height: 4),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: MColors.white
              ),
              child: const Icon(CupertinoIcons.arrow_swap, size: 24, color: MColors.primary,)
            ),
            const SizedBox(height: 4),
            const MTextFormField(
              formName: "Enter Amount",
              labeltext: "\$0.00"
            ),
          ],
        ),
      ),
    );
  }
}