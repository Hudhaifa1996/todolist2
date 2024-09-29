import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolists/providers/listprovider.dart';
import 'view/onboarding.dart';
import 'view/splash.dart';
import 'view/home.dart';
import 'view/listdetails.dart';
import 'view/listedit.dart';
import 'viewmodel/vm_home.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'viewmodel/vm_home2.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  runApp(ChangeNotifierProvider(create: (context) => listProvider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: Home(),
      routes: {
        '/': (context) => SplashScreen(prefs: prefs),
        '/onboarding': (context) => OnBoarding(prefs: prefs),
        '/home': (context) => Home(prefs: prefs),
        '/listdetails': (context) => Listdetails(),
        '/listedit': (context) => Listedit(),

        // '/todo':(context) => Todo(),
      },
    ),
  ));
}
