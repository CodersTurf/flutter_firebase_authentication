import 'package:ccrwork_mobile/routing.dart';
import 'package:ccrwork_mobile/screens/home.dart';
import 'package:ccrwork_mobile/screens/login.dart';
import 'package:ccrwork_mobile/screens/widgets/drawer.dart';
import 'package:ccrwork_mobile/servicelocator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'auth_helper.dart';
import 'bootstrapper.dart';
import 'colors.dart';
import 'common.dart';
import 'navigationservice.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BootStrapper.initializeDIs();
  await Firebase.initializeApp();
  await Auth.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white),
        ),
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      navigatorKey: locator<NavigationService>().navigatorKey,
      onGenerateRoute: generateRoute,
      initialRoute: 'home',
    );
  }
}
