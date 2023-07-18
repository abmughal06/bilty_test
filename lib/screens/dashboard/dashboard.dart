import 'package:bilty/screens/home/history.dart';
import 'package:bilty/screens/home/home.dart';
import 'package:bilty/screens/home/profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/widgets/bottom_nav.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});

  final List<Widget> tabsList = [
    const Home(),
    const HistoryScreen(),
    const Profile()
  ];

  final List<Icon> tabsIconList = [
    const Icon(Icons.home),
    const Icon(Icons.history),
    const Icon(Icons.person),
  ];

  final List<String> tabsLabelList = const [
    "Home",
    "History",
    "Profile",
  ];

  Widget getScreen(int index) {
    switch (index) {
      case 0:
        return tabsList[0];
      case 1:
        return tabsList[1];
      case 2:
        return tabsList[2];

      default:
        return tabsList[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    final screen = Provider.of<BottomNavigationProvider>(context);

    return Scaffold(
      body: Consumer<BottomNavigationProvider>(builder: (context, provider, _) {
        return getScreen(provider.selectedIndex);
      }),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        selectedLabelStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w700,
        ),
        currentIndex: screen.selectedIndex,
        onTap: (index) => screen.setSelectedIndex(index),
        items: List.generate(
          tabsList.length,
          (index) => BottomNavigationBarItem(
            icon: tabsIconList[index],
            label: tabsLabelList[index],
          ),
        ),
      ),
    );
  }
}
