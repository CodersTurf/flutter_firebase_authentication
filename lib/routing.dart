import 'package:ccrwork_mobile/screens/about.dart';
import 'package:ccrwork_mobile/screens/contact.dart';
import 'package:ccrwork_mobile/screens/default.dart';

import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
    case 'home':
      return MaterialPageRoute(builder: (_) => Default());
    case 'about':
      return MaterialPageRoute(builder: (_) => About());
    case 'contacts':
      return MaterialPageRoute(builder: (_) => Contacts());
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}
