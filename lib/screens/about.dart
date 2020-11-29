import 'package:ccrwork_mobile/screens/widgets/appbar.dart';
import 'package:ccrwork_mobile/screens/widgets/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarDef.getAppBar('About'),
        drawer: AppDrawer(),
        body: Container(
          child: Text('About'),
        ));
  }
}
