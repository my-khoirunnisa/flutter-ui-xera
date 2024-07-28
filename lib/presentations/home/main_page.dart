import 'package:flutter/material.dart';
import 'package:flutter_ui_xera/core/constants/colors.dart';
import 'package:flutter_ui_xera/presentations/home/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.navy800,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: AppColors.darkgrey,
          primaryColor: AppColors.primary,
        ),
        child: BottomNavigationBar(
          selectedIconTheme: const IconThemeData(color: Colors.white),
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          unselectedFontSize: 11,
          selectedFontSize: 11,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.history), label: 'History'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_2_outlined), label: 'Profile'),
          ],
        ),
      ),
      body: const HomePage(),
    );
  }
}
