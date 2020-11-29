import 'package:ccrwork_mobile/screens/widgets/appbar.dart';
import 'package:ccrwork_mobile/screens/widgets/drawer.dart';
import 'package:flutter/material.dart';

import '../auth_helper.dart';
import '../colors.dart';
import '../common.dart';
import 'home.dart';
import 'login.dart';

class Default extends StatefulWidget {
  Default({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Default> {
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
        fontSize: !isSelected ? 17 : 18);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      drawer: Auth.user == null ? null : AppDrawer(),

      appBar: AppBarDef.getAppBar(context, 'Home'),
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
