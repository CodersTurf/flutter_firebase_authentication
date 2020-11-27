import 'package:ccrwork_mobile/screens/home.dart';
import 'package:ccrwork_mobile/screens/login.dart';
import 'package:flutter/material.dart';

import 'auth_helper.dart';
import 'colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String title = "";

  @override
  initState() {
    super.initState();
    setTitle();
  }

  setTitle() {
    if (Auth.user == null) {
      title = "User Authentication";
    } else {
      title = "CRC Work";
    }
  }

  void _refreshPage() {
    setState(() {
      setTitle();
    });
  }

  logout(choice) async {
    if (choice == "Logout") {
      await Auth().signOut();
      _refreshPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(color: AppColor.headerTextColor),
        ),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: logout,
            icon: Icon(Icons.account_circle_outlined),
            itemBuilder: (BuildContext context) => [
              PopupMenuItem<String>(
                value: "Logout",
                child: Text("Logout"),
              ),
            ],
          )
        ],
        backgroundColor: AppColor.headerColor,
      ),
      body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: (Auth.user == null || Auth.user.uid == null)
              ? LoginPage(
                  onSignIn: _refreshPage,
                )
              : Home()),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
