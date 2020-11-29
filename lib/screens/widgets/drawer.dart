import 'package:ccrwork_mobile/colors.dart';
import 'package:flutter/material.dart';

import '../../auth_helper.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Color.fromRGBO(0, 0,0,0.5)),
            accountName: Text('Logged User'),
            accountEmail: Text(Auth.user.email),

            currentAccountPicture: Image.asset(
              'assets/images/0.jpg',
              width: 150,
              height: 150,
              fit: BoxFit.fill,
            ),
            otherAccountsPictures: <Widget>[],
          ),
          ListTile(
              title: const Text(
                'Home',
                style: TextStyle(color: Colors.black),
              ),
              onTap: () => Navigator.pushNamed(context, '/')),
          ListTile(
              title: const Text(
                'About',
                style: TextStyle(color: Colors.black),
              ),
              onTap: () => Navigator.pushNamed(context, 'about')),
          ListTile(
              title: const Text(
                'Contacts',
                style: TextStyle(color: Colors.black),
              ),
              onTap: () => Navigator.pushNamed(context, 'contacts')),
          ListTile(
              title: const Text(
                'Global Reach',
                style: TextStyle(color: Colors.black),
              ),
              onTap: () => Navigator.pushNamed(context, 'global')),
          ListTile(
              title: const Text(
                'Outsourcing',
                style: TextStyle(color: Colors.black),
              ),
              onTap: () => Navigator.pushNamed(context, 'outsource')),
          ListTile(
              title: const Text(
                'Industry Sectors',
                style: TextStyle(color: Colors.black),
              ),
              onTap: () => Navigator.pushNamed(context, 'industry')),
          ListTile(
              title: Container(
                  width: 60,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColor.mainColor)),
                  child: Text(
                    'Candidates',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  )),
              onTap: () => Navigator.pushNamed(context, 'candidates')),
        ],
      ),
    );
  }
}
