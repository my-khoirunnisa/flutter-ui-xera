import 'package:flutter/material.dart';
import '../constants/colors.dart';

class ImageHeader extends StatelessWidget {
  const ImageHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 100),
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.navyShadow,
                  spreadRadius: 180,
                  blurRadius: 500,
                )
              ],
            ),
          ),
          Positioned(
            bottom: -15,
            child: Container(
              height: 25,
              width: 180,
              decoration: BoxDecoration(
                color: AppColors.navy300,
                border: Border.all(color: Colors.black, width: 0.0),
                borderRadius:
                    const BorderRadius.all(Radius.elliptical(180, 30)),
              ),
            ),
          ),
          Image.asset(
            'assets/images/robot.png',
            width: 250,
          ),
        ],
      ),
    );
  }
}
