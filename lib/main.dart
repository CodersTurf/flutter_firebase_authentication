import 'package:ccrwork_mobile/screens/home.dart';
import 'package:ccrwork_mobile/screens/login.dart';
import 'package:flutter/material.dart';

import 'auth_helper.dart';
import 'colors.dart';
import 'common.dart';

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
  String selectedMenu = "Home";
  Widget page = Home();
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

  void changeMenu(String menu) {
    selectedMenu = menu;
    setState(() {
      page = Helper.getPage(menu);
    });
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

  getMenuTextStyle(bool isSelected) {
    return TextStyle(
        color: !isSelected
            ? AppColor.footerTextColor
            : AppColor.footerTextColorSelected,
        fontWeight: !isSelected ? FontWeight.normal : FontWeight.bold,
        fontSize: !isSelected ? 15 : 16);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Auth.user == null
          ? SizedBox(
              height: 1,
            )
          : Container(
              color: AppColor.footerColor,
              height: 50,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                        onTap: () {
                          changeMenu("Home");
                        },
                        child: Text(
                          "Home",
                          style: getMenuTextStyle(selectedMenu == "Home"),
                        )),
                    SizedBox(
                      width: 30,
                    ),
                    GestureDetector(
                        onTap: () {
                          changeMenu("About");
                        },
                        child: Text(
                          "About",
                          style: getMenuTextStyle(selectedMenu == "About"),
                        )),
                    SizedBox(
                      width: 30,
                    ),
                    GestureDetector(
                        onTap: () {
                          changeMenu("Industry Sectors");
                        },
                        child: Text(
                          "Industry Sectors",
                          style: getMenuTextStyle(
                              selectedMenu == "Industry Sectors"),
                        )),
                    SizedBox(
                      width: 30,
                    ),
                    GestureDetector(
                        onTap: () {
                          changeMenu("Global Reach");
                        },
                        child: Text(
                          "Global Reach",
                          style:
                              getMenuTextStyle(selectedMenu == "Global Reach"),
                        )),
                    SizedBox(
                      width: 30,
                    ),
                    GestureDetector(
                        onTap: () {
                          changeMenu("Resourcing");
                        },
                        child: Text(
                          "Resourcing",
                          style: getMenuTextStyle(selectedMenu == "Resourcing"),
                        )),
                    SizedBox(
                      width: 30,
                    ),
                    GestureDetector(
                        onTap: () {
                          changeMenu("Contact");
                        },
                        child: Text(
                          "Contact",
                          style: getMenuTextStyle(selectedMenu == "Contact"),
                        )),
                  ],
                ),
              )),
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(color: AppColor.headerTextColor),
        ),
        actions: <Widget>[
          Auth.user == null
              ? Container()
              : PopupMenuButton<String>(
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
              : page),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
