import 'package:flutter/material.dart';
import 'package:flutter_ui_xera/core/constants/colors.dart';
import 'package:flutter_ui_xera/core/constants/text_style.dart';
import 'package:flutter_ui_xera/presentations/home/main_page.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

import '../../core/components/image_header.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  bool isFinished = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.navy800,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ImageHeader(),
            const SizedBox(height: 80),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.navy200,
                          borderRadius: BorderRadius.circular(50)),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.settings),
                            SizedBox(width: 10),
                            Text(
                              'Automated XERA AI',
                              style: bodyTextStyle,
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Unleash Your Creativity with XERA!',
                      style: h1TextStyle,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'With our advanced AI technology, you can turn the concept into artwork in seconds.',
                      style: bodyGreyTextStyle,
                    ),
                    const SizedBox(height: 30),
                    SwipeableButtonView(
                      buttonColor: AppColors.primary,
                      buttonText: "Slide to Start",
                      buttontextstyle: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                      buttonWidget: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.white,
                      ),
                      activeColor: AppColors.navy200,
                      isFinished: isFinished,
                      onWaitingProcess: () {
                        Future.delayed(const Duration(seconds: 2), () {
                          setState(() {
                            isFinished = true;
                          });
                        });
                      },
                      onFinish: () async {
                        await Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: const MainPage(),
                          ),
                        );
                        setState(() {
                          isFinished = false;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
