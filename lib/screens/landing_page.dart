import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wally/screens/auth_page.dart';
import 'package:wally/screens/home_page.dart';
import 'package:wally/screens/loading_page.dart';
import 'package:wally/services/auth.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthBase auth = Provider.of<AuthBase>(context);
    return StreamBuilder<User>(
      stream: auth.getCurrentAuthState(),
      builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final User thisUser = snapshot.data;
          if (thisUser != null) {
            return HomePage();
          } else
            return AuthPage();
        } else
          return LoadingPage();
      },
    );
  }
}
