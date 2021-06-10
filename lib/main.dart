import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './provider/items_provider.dart';
import './screens/home_screen.dart';
import './screens/country_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Countries(),
      child: MaterialApp(
        title: 'EU Countries App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen('EU Countries App'),
        routes: {
          '/county_screen': (context) => CountryScreen(),
        },
      ),
    );
  }
}
