import 'package:flutter/material.dart';

import '../../colors.dart';

class AppBarDef {
  static getAppBar(title) {
    return AppBar(
        title: Text(
      title,
      style: TextStyle(color: AppColor.headerTextColor),
    ));
  }
}
