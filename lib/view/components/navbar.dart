import 'package:flutter/material.dart';
import 'package:titans_crypto/main.dart';
import 'package:titans_crypto/view/Home/home_screen.dart';
import 'package:titans_crypto/view/utils/navbar_utils.dart';

class NavigationBars extends StatefulWidget {
  const NavigationBars({
    super.key,
  });

  @override
  State<NavigationBars> createState() => _NavigationBarsState();
}

class _NavigationBarsState extends State<NavigationBars> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: $styles.colors.green,
          unselectedItemColor: Colors.grey,
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          items: appBarDestinations),
      body: <Widget>[
        const HomeScreen(),
        const HomeScreen(),
        const HomeScreen(),
        const HomeScreen(),
      ][selectedIndex],
    );
  }
}
