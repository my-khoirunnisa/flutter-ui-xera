import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/text_style.dart';

class FilterType extends StatelessWidget {
  const FilterType({
    super.key,
    required this.title,
    required this.isSelected,
  });

  final String title;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : AppColors.navy300,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: Center(
          child: Text(
            title,
            style: isSelected ? h6TextStyle : bodyTextStyle,
          ),
        ),
      ),
    );
  }
}
