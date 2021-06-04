import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wally/models/viewer.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:wally/utils/router.dart';
import 'package:wally/utils/theme_config.dart';
import 'package:wally/view_models/app_provider.dart';
import 'package:wally/views/info/info.dart';

class Account extends StatefulWidget {
  final Viewer loggedInUser;
  const Account(this.loggedInUser);
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  List items;

  @override
  void initState() {
    super.initState();
    items = [
      {
        'icon': Feather.heart,
        'title': 'Favorites',
        'function': () {},
      },
      {
        'icon': Feather.download,
        'title': 'Downloads',
        'function': () {},
      },
      {
        'icon': Feather.moon,
        'title': 'Dark Mode',
        'function': () {},
      },
      {
        'icon': Feather.info,
        'title': 'About',
        'function': () => _pushPage(Info()),
      },
      {
        'icon': Feather.file_text,
        'title': 'Licenses',
        'function': () {},
      },
      {
        'icon': Icons.exit_to_app,
        'title': 'Sign Out',
        'function': () {},
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    // Remove Dark Switch if Device has Dark mode enabled
    if (MediaQuery.of(context).platformBrightness == Brightness.dark) {
      items.removeWhere((item) => item['title'] == 'Dark Mode');
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                        image: NetworkImage(widget.loggedInUser.imgUrl)),
                  ),
                ),
                title: Text(
                  widget.loggedInUser.name,
                  style: Theme.of(context).textTheme.headline6,
                ),
                subtitle: Text(
                  widget.loggedInUser.email,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
            ),
            Divider(),
            ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 10),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                if (items[index]['title'] == 'Dark Mode') {
                  return _buildThemeSwitch(items[index]);
                }

                return ListTile(
                  onTap: items[index]['function'],
                  leading: Icon(
                    items[index]['icon'],
                  ),
                  title: Text(
                    items[index]['title'],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThemeSwitch(Map item) {
    return SwitchListTile(
      secondary: Icon(
        item['icon'],
      ),
      title: Text(
        item['title'],
      ),
      value: Provider.of<AppProvider>(context).theme == ThemeConfig.lightTheme
          ? false
          : true,
      onChanged: (v) {
        if (v) {
          Provider.of<AppProvider>(context, listen: false)
              .setTheme(ThemeConfig.darkTheme, 'dark');
        } else {
          Provider.of<AppProvider>(context, listen: false)
              .setTheme(ThemeConfig.lightTheme, 'light');
        }
      },
    );
  }

    _pushPage(Widget page) {
    MyRouter.pushPage(context, page);
  }
}
