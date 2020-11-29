import 'package:ccrwork_mobile/screens/widgets/appbar.dart';
import 'package:ccrwork_mobile/screens/widgets/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

class Industry extends StatefulWidget {
  @override
  _Industry createState() => _Industry();
}

class _Industry extends State<Industry> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarDef.getAppBar('Industry'),
        drawer: AppDrawer(),
        body: Container(
          child: Text('Industry'),
        ));
  }
}
