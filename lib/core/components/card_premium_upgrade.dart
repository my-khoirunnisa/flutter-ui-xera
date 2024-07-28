import 'package:flutter/material.dart';
import 'package:flutter_ui_xera/core/constants/colors.dart';

import '../constants/text_style.dart';

class CardPremiumUpgrade extends StatelessWidget {
  const CardPremiumUpgrade({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primary,
            AppColors.primary800,
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Premium Plan',
                  style: h4TextStyle,
                ),
                const SizedBox(height: 10),
                const SizedBox(
                  width: 200,
                  child: Text(
                    'Optimize all features with Premium Version. Try It Out!',
                    // maxLines: 2,
                    style: bodyTextStyle,
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Upgrade Plan',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )
              ],
            ),
            Image.asset(
              'assets/images/robot2.png',
              width: 100,
            )
          ],
        ),
      ),
    );
  }
}
