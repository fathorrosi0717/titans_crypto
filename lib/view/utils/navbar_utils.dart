import 'package:flutter/material.dart';

List<BottomNavigationBarItem> appBarDestinations = [
  const BottomNavigationBarItem(
    backgroundColor: Colors.black,
    tooltip: '',
    icon: Icon(
      Icons.home,
    ),
    activeIcon: Icon(
      Icons.home_filled,
    ),
    label: 'Home',
  ),
  const BottomNavigationBarItem(
    backgroundColor: Colors.black,
    tooltip: '',
    icon: Icon(
      Icons.notifications,
    ),
    activeIcon: Icon(Icons.notifications_active),
    label: 'Notificaions',
  ),
  const BottomNavigationBarItem(
    backgroundColor: Colors.black,
    tooltip: '',
    icon: Icon(
      Icons.favorite_border,
    ),
    activeIcon: Icon(Icons.favorite),
    label: 'Favorite',
  ),
  const BottomNavigationBarItem(
    backgroundColor: Colors.black,
    tooltip: '',
    icon: Icon(
      Icons.person,
    ),
    activeIcon: Icon(Icons.person_rounded),
    label: 'Profile',
  )
];
