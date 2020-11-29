import 'package:ccrwork_mobile/screens/about.dart';
import 'package:ccrwork_mobile/screens/contact.dart';
import 'package:ccrwork_mobile/screens/default.dart';
import 'package:ccrwork_mobile/screens/global.dart';
import 'package:ccrwork_mobile/screens/industry.dart';
import 'package:ccrwork_mobile/screens/outsource.dart';

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
    case 'global':
      return MaterialPageRoute(builder: (_) => Global());
    case 'outsource':
      return MaterialPageRoute(builder: (_) => OutSource());
    case 'industry':
      return MaterialPageRoute(builder: (_) => Industry());
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}
