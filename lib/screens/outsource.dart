import 'package:ccrwork_mobile/screens/widgets/appbar.dart';
import 'package:ccrwork_mobile/screens/widgets/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

class OutSource extends StatefulWidget {
  @override
  _OutSource  createState() => _OutSource ();
}

class _OutSource  extends State<OutSource > {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarDef.getAppBar('OutSource'),
        drawer: AppDrawer(),
        body: Container(
          child: Text('OutSource'),
        ));
  }
}
