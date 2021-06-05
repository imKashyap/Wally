import 'package:flutter/material.dart';

class Favorites extends StatelessWidget {
  const Favorites({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const space = const SizedBox(
      height: 20.0,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Icon(
            Icons.add_photo_alternate_outlined,
            size: 100.0,
            color: Theme.of(context).hintColor,
          ),
          space,
          space,
          Text(
            'No favorites found',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline6,
          ),
          space,
          Text(
            'Mark wallpapers as favorite \n to view them here',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1.copyWith(
              color: Theme.of(context).hintColor
            ),
          ),
        ],
      ),
    );
  }
}
