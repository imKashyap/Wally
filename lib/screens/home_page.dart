import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:wally/screens/categories_page.dart';
import 'package:wally/screens/latest_page.dart';
import 'package:wally/screens/user_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedPage = 0;
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> _pages = [
      {'page': LatestPage(), 'title': 'Popular now'},
      {'page': CategoriesPage(), 'title': 'Categories'},
      {'page': UserPage(), 'title': 'User'}
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: Color(0xFF111820),
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(_pages[_selectedPage]['title'],
                style: Theme.of(context).textTheme.headline4),
          )),
      body: _pages[_selectedPage]['page'],
      // bottomNavigationBar: BottomNavigationBar(
      //   onTap: _selectPage,
      //   items: [
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.home_outlined),
      //         activeIcon: Icon(Icons.home_filled),
      //         label: 'Home'),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.category_outlined),
      //         activeIcon: Icon(Icons.category),
      //         label: 'Categories'),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.person_outline_outlined),
      //         activeIcon: Icon(Icons.person),
      //         label: 'User'),
      //   ],
      //   backgroundColor: Colors.transparent,
      //   selectedItemColor: Color(0xFFF3AA4E),
      //   currentIndex: _selectedPage,
      //   showSelectedLabels: false,
      //   showUnselectedLabels: false,
      //   type: BottomNavigationBarType.fixed,
      // ),
      bottomNavigationBar: CurvedNavigationBar(
        onTap: _selectPage,
        backgroundColor: Color(0xFF111820),
        // color: Colors.red.shade900,
        height: 60.0,
        color: Color(0xFF316542),
        items: [
          Icon(Icons.home_outlined),
          Icon(Icons.category_outlined),
          Icon(Icons.person_outline_outlined),
        ],
        animationCurve: Curves.bounceInOut,
        animationDuration: Duration(milliseconds: 300),
      ),
    );
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPage = index;
    });
  }
}
