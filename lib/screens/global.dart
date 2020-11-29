import 'package:ccrwork_mobile/screens/widgets/appbar.dart';
import 'package:ccrwork_mobile/screens/widgets/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

class Global extends StatefulWidget {
  @override
  _Global createState() => _Global();
}

class _Global extends State<Global> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarDef.getAppBar(context, 'Global Reach'),
        drawer: AppDrawer(),
        body: Container(
          child: Text('Global'),
        ));
  }
}
