import 'package:flutter/material.dart';
import 'package:flutter_ui_xera/core/components/filter_type.dart';
import 'package:flutter_ui_xera/core/constants/colors.dart';
import 'package:flutter_ui_xera/core/constants/text_style.dart';
import 'package:flutter_ui_xera/data/model/service.dart';
import 'package:flutter_ui_xera/presentations/detail/detail_page.dart';

import '../../core/components/card_premium_upgrade.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List filters = [
    ['All', true],
    ['Video', false],
    ['Image', false],
  ];

  int filterSelected = 0;

  void filterTypeSelected(int index) {
    setState(() {
      for (var i = 0; i < filters.length; i++) {
        filters[i][1] = false;
      }
      filters[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Hello,\nKhoirunnisa\' 👋',
                  style: h1TextStyle,
                ),
                Container(
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.navyShadow,
                        spreadRadius: 50,
                        blurRadius: 50,
                      ),
                    ],
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 5),
            const Text(
              'Let\'s meet Our Powerful AI Assistant',
              style: bodyGreyTextStyle,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: CardPremiumUpgrade(),
            ),
            const Text(
              'Our Main Features',
              style: h4TextStyle,
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 40,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: InkWell(
                      onTap: () => filterTypeSelected(index),
                      child: FilterType(
                        title: filters[index][0],
                        isSelected: filters[index][1],
                      ),
                    ),
                  );
                },
              ),
            ),
            GridView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16.0,
                  crossAxisSpacing: 16.0),
              itemCount: serviceList.length,
              itemBuilder: (_, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(_, MaterialPageRoute(builder: (_) {
                      return const DetailPage();
                    }));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.navy200,
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                    ), // color of grid items
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [
                                AppColors.navyShadow,
                                AppColors.navy300,
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Icon(
                              serviceList[index].icon,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          serviceList[index].title,
                          style: h6LightTextStyle,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          serviceList[index].description,
                          style: bodySmallTextStyle,
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
