import 'package:flutter/material.dart';
import 'package:flutter_ui_xera/core/components/custom_app_bar.dart';
import 'package:flutter_ui_xera/core/components/outline_light_button.dart';
import 'package:flutter_ui_xera/core/components/primary_button.dart';
import 'package:flutter_ui_xera/core/constants/colors.dart';
import 'package:flutter_ui_xera/core/constants/text_style.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List photos = [
    ['assets/images/detail-1.jpg', true],
    ['assets/images/detail-2.jpg', false],
    ['assets/images/detail-3.jpg', false],
    ['assets/images/detail-4.jpg', false],
  ];

  List butonActions = [
    ['Download', Icons.download_outlined],
    ['Share', Icons.share]
  ];

  String? thumbnail;

  @override
  void initState() {
    thumbnail = photos[0][0];
    super.initState();
  }

  void photoSelected(int index) {
    setState(() {
      for (var i = 0; i < photos.length; i++) {
        photos[i][1] = false;
      }
      photos[index][1] = true;
      thumbnail = photos[index][0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.navy800,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: CustomAppBar(title: 'Generate Image'),
            ),
            Expanded(
              // height: 350,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  thumbnail!,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            GridView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 5.0,
                  crossAxisSpacing: 10.0),
              itemCount: photos.length,
              itemBuilder: (_, index) {
                return InkWell(
                  onTap: () => photoSelected(index),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.navy200,
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                      border: Border.all(
                        width: photos[index][1] ? 2 : 0,
                        color: photos[index][1]
                            ? AppColors.blue
                            : Colors.transparent,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        photos[index][0],
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 30),
            PrimaryButton(
              title: 'Regenerate Image',
              icon: Icons.star_border,
              // ignore: void_checks
              onTap: () {},
            ),
            GridView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                childAspectRatio: 1 / 0.28,
              ),
              itemCount: butonActions.length,
              itemBuilder: (_, index) {
                return OutlineLightButton(
                    title: butonActions[index][0],
                    icon: butonActions[index][1],
                    // ignore: void_checks
                    onTap: () {});
              },
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
      bottomNavigationBar: Container(
          height: 70,
          color: AppColors.darkgrey,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.settings,
                  color: AppColors.blue,
                ),
                const SizedBox(width: 10),
                const Text(
                  'Use 1 of 10 Boost.',
                  style: bodyTextStyle,
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Upgrade for more',
                    style: TextStyle(
                        color: AppColors.primary,
                        decoration: TextDecoration.underline),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
