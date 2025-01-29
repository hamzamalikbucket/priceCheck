import 'package:compareapp/resources/utils/routs.dart';
import 'package:flutter/material.dart';
import 'package:timezone/data/latest.dart' as tz;


void main() {
  tz.initializeTimeZones();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appGenerateRoute = AppRoute();


  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Compare App',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: _appGenerateRoute.onGenerateRoute,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: false,
        cardColor: Colors.white,
      ),
    );
  }
}
