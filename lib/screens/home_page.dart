import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:wally/models/viewer.dart';
import 'package:wally/screens/categories_page.dart';
import 'package:wally/screens/latest_page.dart';
import 'package:wally/screens/account_page.dart';
import 'package:wally/services/auth.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      {'page': LatestPage(), 'title': 'Popular now'},
      {'page': CategoriesPage(), 'title': 'Categories'},
      {'page': AccountPage(loggedInUser), 'title': 'Account'}
    ];

    return Scaffold(
        // appBar: AppBar(
        //     title: Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Text(_pages[_selectedPage]['title'],
        //       style: Theme.of(context).textTheme.headline6),
        // )),
        //body: _pages[_selectedPage]['page'],
        body: SizedBox.expand(
          child: PageView(
            controller: _pageController,
            onPageChanged: _selectPage,
            children: <Widget>[
              _pages[0]['page'],
              _pages[1]['page'],
              _pages[2]['page'],
            ],
          ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(color: Colors.transparent, boxShadow: [
            BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
          ]),
          child: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: GNav(
                  rippleColor: Colors.grey[500],
                  hoverColor: Colors.grey[900],
                  gap: 8,
                  activeColor: Colors.white,
                  iconSize: 24,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  duration: Duration(milliseconds: 400),
                  tabBackgroundColor: Color(0xFF111820),
                  tabs: [
                    GButton(
                      icon: Icons.home_outlined,
                      text: 'Home',
                    ),
                    GButton(
                      icon: Icons.category_outlined,
                      text: 'Categories',
                    ),
                    GButton(
                      icon: Icons.person_outline_outlined,
                      text: 'Account',
                    ),
                  ],
                  selectedIndex: _selectedPage,
                  onTabChange: (index) {
                    setState(() {
                      _selectedPage = index;
                      _pageController.jumpToPage(index);
                    });
                  }),
            ),
          ),
        ));
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPage = index;
    });
  }
}
