import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wally/models/viewer.dart';
import 'package:wally/screens/info_page.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:wally/utils/theme_config.dart';
import 'package:wally/view_models/app_provider.dart';

class AccountPage extends StatefulWidget {
  final Viewer loggedInUser;
  const AccountPage(this.loggedInUser);
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
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
        'function': (){},
      },
      {
        'icon': Feather.moon,
        'title': 'Dark Mode',
        'function': () {},
      },
      {
        'icon': Feather.info,
        'title': 'About',
        'function': () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => InfoPage(), fullscreenDialog: true)),
      },
      {
        'icon': Feather.file_text,
        'title': 'Licenses',
        'function': (){},
      },
       {
        'icon': Icons.exit_to_app,
        'title': 'Sign Out',
        'function': (){},
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
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(widget.loggedInUser.imgUrl),
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
}
