import 'package:flutter/material.dart';

import '../../auth_helper.dart';
import '../../colors.dart';

class AppBarDef {
  static getAppBar(BuildContext context, title) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(color: AppColor.headerTextColor),
      ),
      actions: <Widget>[
        Auth.user == null
            ? Container()
            : PopupMenuButton<String>(
                onSelected: (data) async {
                  await Auth().signOut();
                  Navigator.pushNamed(context, '/');
                },
                icon: Icon(Icons.account_circle_outlined),
                itemBuilder: (BuildContext context) => [
                  PopupMenuItem<String>(
                    value: "Logout",
                    child: Text("Logout"),
                  ),
                ],
              )
      ],
      backgroundColor: AppColor.mainColor,
    );
  }
}
