import 'package:booklistingapp/screens/home.dart';
import 'package:booklistingapp/screens/search.dart';
import 'package:flutter/cupertino.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> get(BuildContext context) {
    return {
      HomeScreen.routeName: (context) => const HomeScreen(),
      SearchScreen.routeName: (context) => const SearchScreen(),
    };
  }
}
