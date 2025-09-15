import 'package:compareapp/resources/utils/routs.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest.dart' as tz;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final _appGenerateRoute = AppRoute();
  final bool isLoggedIn;


  MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: isLoggedIn ? '/BottomNavigationBarScreen' : '/LoginScreen',
      title: 'Compare App',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: _appGenerateRoute.onGenerateRoute,
      theme: ThemeData(
        primarySwatch: Colors.green,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: false,
        cardColor: Colors.white,
      ),
    );
  }
}
