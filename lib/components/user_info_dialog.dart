import 'package:flutter/material.dart';
import 'package:wally/models/viewer.dart';

class UserInfoDialog extends StatelessWidget {
  final Viewer loggedInUser;
  const UserInfoDialog({Key key, this.loggedInUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: EdgeInsets.zero,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.close_rounded)),
          Text(
            'Wally',
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(fontWeight: FontWeight.bold),
          ),
          Opacity(
            opacity: 0.0,
            child: Icon(Icons.close_rounded),
          )
        ],
      ),
      contentPadding: const EdgeInsets.fromLTRB(7.0, 10.0, 14.0, 4.0),
      content: SingleChildScrollView(
        child: ListBody(
          children: [
            ListTile(
              leading: Container(
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(loggedInUser.imgUrl)),
                ),
              ),
              title: Text(
                loggedInUser.name,
                style: Theme.of(context).textTheme.subtitle2,
              ),
              subtitle: Text(
                loggedInUser.email,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .copyWith(color: Colors.grey),
              ),
            ),
            OutlinedButton(onPressed: () {}, child: Text('Sign Out'))
          ],
        ),
      ),
    );
  }
}
