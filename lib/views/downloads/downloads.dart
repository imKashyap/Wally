import 'package:flutter/material.dart';

class Downloads extends StatelessWidget {
  const Downloads({ Key key }) : super(key: key);
@override
  Widget build(BuildContext context) {
    const space = const SizedBox(
      height: 20.0,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Downloads'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Icon(
            Icons.download,
            size: 100.0,
            color: Theme.of(context).hintColor,
          ),
          space,
          space,
          Text(
            'No Wallpapers downloaded',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline6,
          ),
          space,
          Text(
            'Download wallpapers \n to view them here',
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