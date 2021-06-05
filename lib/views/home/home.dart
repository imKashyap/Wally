import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wally/components/drawer.dart';
import 'package:wally/models/viewer.dart';
import 'package:wally/services/auth.dart';
import 'package:wally/views/categories/categories.dart';
import 'package:wally/views/curated/curated.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Viewer loggedInUser;
  int _selectedPage = 0;
  PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    loggedInUser = Provider.of<AuthBase>(context).getCurrentUser();
    final List<Map<String, dynamic>> _pages = [
      {
        'page': Curated(
          loggedInUser: loggedInUser,
        ),
        'title': 'Popular now'
      },
      {
        'page': Categories(
          loggedInUser: loggedInUser,
        ),
        'title': 'Categories'
      },
    ];

    return Scaffold(
      drawer: Drawers(),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: _selectPage,
          children: <Widget>[
            _pages[0]['page'],
            _pages[1]['page'],
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.red
            : Theme.of(context).accentColor,
        backgroundColor: Theme.of(context).bottomAppBarColor,
        onTap: onTabTapped,
        currentIndex: _selectedPage,
        items: [
          new BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0),
              child: Icon(Icons.home, size: 30.0),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category, size: 30.0),
            label: 'Categories',
          )
        ],
      ),
    );
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  void onTabTapped(int index) {
    setState(() {
      _selectedPage = index;
      _pageController.jumpToPage(index);
    });
  }
}
