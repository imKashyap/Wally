import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:wally/utils/router.dart';
import 'package:wally/views/downloads/downloads.dart';
import 'package:wally/views/favorites/favorites.dart';
import 'package:wally/views/info/info.dart';
import 'package:wally/views/settings/settings.dart';

class Drawers extends StatefulWidget {
  const Drawers({Key key}) : super(key: key);
  @override
  _DrawersState createState() => _DrawersState();
}

class _DrawersState extends State<Drawers> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(20, 50, 0, 10),
            width: MediaQuery.of(context).size.width * 0.8,
            child: Text(
              'Wally',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Divider(),
          _buildDrawerItem('Home', Icons.home_outlined, () {
            Navigator.of(context).pop();
          }),
          _buildDrawerItem(
              'Favorites', Feather.heart, () => _pushPage(Favorites())),
          _buildDrawerItem('Downloads', Feather.download, () => _pushPage(Downloads())),
          _buildDrawerItem('About', Feather.info, () => _pushPage(Info())),
          Divider(),
          _buildDrawerItem('Settings', Icons.settings, ()=>_pushPage(Settings())),
          _buildDrawerItem('Help & Feedback', Feather.help_circle, () {}),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(String title, IconData icon, Function onTap) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Flexible(
            flex: 20,
            child: Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding:
                  const EdgeInsets.symmetric(vertical: 10).copyWith(left: 20),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
                color: title == 'Home'
                    ? Theme.of(context).primaryColorLight
                    : null,
              ),
              child: Row(
                children: [
                  Icon(icon,
                      color: title == 'Home'
                          ? Theme.of(context).accentColor
                          : null),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                        color: title == 'Home'
                            ? Theme.of(context).accentColor
                            : null),
                  ),
                ],
              ),
            ),
          ),
          const Flexible(child: Text(''))
        ],
      ),
    );
  }

  _pushPage(Widget page) {
    Navigator.pop(context);
    MyRouter.pushPage(context, page);
  }
}
