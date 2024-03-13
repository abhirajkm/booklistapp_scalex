import 'package:booklistingapp/providers/index.dart';
import 'package:booklistingapp/routes.dart';
import 'package:booklistingapp/screens/home.dart';
import 'package:booklistingapp/utils/text.dart';
import 'package:booklistingapp/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProviderTree.get(context),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: appTitle,
        theme: appTheme,
        home: const HomeScreen(),
        routes: AppRoutes.get(context),
      ),
    );
  }
}
