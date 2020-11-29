import 'package:flutter/material.dart';

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
            accountName: Text('User Name'),
            accountEmail: Text('user.name@email.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: FlutterLogo(size: 42.0),
            ),
            otherAccountsPictures: <Widget>[],
          ),
          ListTile(
              title: const Text('Home'),
              onTap: () => Navigator.pushNamed(context, '/')),
          ListTile(
              title: const Text('About'),
              onTap: () => Navigator.pushNamed(context, 'about')),
          ListTile(
              title: const Text('Contacts'),
              onTap: () => Navigator.pushNamed(context, 'contacts')),
          ListTile(
            title: const Text('Global Reach'),
            onTap: () => Navigator.of(context).push(null),
          ),
          ListTile(
              title: const Text('Outsourcing'),
              onTap: () => Navigator.of(context).push(null)),
          ListTile(
            title: const Text('Industry Sectors'),
            onTap: () => Navigator.of(context).push(null),
          ),
        ],
      ),
    );
  }
}
