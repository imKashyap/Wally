import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wally/views/auth/login.dart';
import 'package:wally/views/home/home.dart';
import 'package:wally/views/loading/loading.dart';
import 'package:wally/services/auth.dart';
import 'package:provider/provider.dart';

class ViewProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthBase auth = Provider.of<AuthBase>(context);
    return StreamBuilder<User>(
      stream: auth.getCurrentAuthState(),
      builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final User thisUser = snapshot.data;
          if (thisUser != null) {
            return Home();
          } else
            return Login();
        } else
          return Loading();
      },
    );
  }
}
