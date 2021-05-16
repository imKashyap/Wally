import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wally/view_models/view_provider.dart';
import 'package:wally/screens/onboarding_page.dart';
import 'package:wally/services/auth.dart';
import 'package:provider/provider.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // SystemChrome.setEnabledSystemUIOverlays([]);
//     return MultiProvider(
//       providers: [
//         Provider<AuthBase>.value(value: Auth()),
//       ],
//       child: MaterialApp(
//         title: 'Wally',
//         theme: ThemeData(
//           brightness: Brightness.dark,
//           fontFamily: 'GoogleSans',
//         ),
//         debugShowCheckedModeBanner: false,
//         home: LandingPage(),
//       ),
//     );
//   }
// }

// class SplashScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           SizedBox(
//             height: 200.0,
//           ),
//           Image.asset(
//             'assets/images/logo.png',
//             scale: 4,
//           ),
//           SizedBox(
//             height: 70.0,
//           ),
//           Text(
//             'Wally',
//             textAlign: TextAlign.center,
//             style: Theme.of(context).textTheme.headline4.copyWith(
//                   color: Colors.white.withOpacity(0.25),
//                   fontWeight: FontWeight.w600,
//                 ),
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:shared_preferences/shared_preferences.dart';
import 'package:wally/utils/consts.dart';
import 'package:wally/utils/theme_config.dart';
import 'package:wally/view_models/app_provider.dart';


int initScreen;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = prefs.getInt("initScreen");
  await prefs.setInt("initScreen", 1);
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        Provider<AuthBase>.value(value: Auth()),
        ChangeNotifierProvider(create: (_) => AppProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (BuildContext context, AppProvider appProvider, Widget child) {
        return MaterialApp(
          key: appProvider.key,
          debugShowCheckedModeBanner: false,
          navigatorKey: appProvider.navigatorKey,
          title: Constants.appName,
          theme: themeData(appProvider.theme, context),
          darkTheme: themeData(ThemeConfig.darkTheme, context),
          home: initScreen == 0 || initScreen == null ?OnboardingPage():ViewProvider(),
        );
      },
    );
  }

  // Apply font to our app's theme
  ThemeData themeData(ThemeData theme, BuildContext context) {
    return theme.copyWith(
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'GoogleSans',
              bodyColor: theme.brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
              displayColor: theme.brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
            ));
  }
}

