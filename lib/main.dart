import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolists/providers/listprovider.dart';
import 'view/onboarding.dart';
import 'view/splash.dart';
import 'view/home.dart';
import 'view/listdetails.dart';
import 'view/listedit.dart';
import 'viewmodel/vm_home.dart';
import 'package:todolists/viewmodel/vm_listdetails.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
void main() async {
  // List<MiniCard> cardInfo =;
  // WidgetsFlutterBinding.ensureInitialized();
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // List<String> mini2 = ['hoz','222222222222'];
  // saveMiniCardList(mini2);
  // List<String>? miniCards2 = prefs.getStringList('MiniCard_list');
  // print('minicard is $miniCards2');

  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create:(context) => listProvider()
          )
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
        // home: Home(),
            routes: {
        '/': (context) => Splash(),
        '/onboarding':(context) => OnBoarding(),
        '/home':(context) => VmHome(),
              '/listdetails':(context) => Listdetails(),
              '/listedit':(context) => Listedit(),

        // '/todo':(context) => Todo(),
            },
            ),
      ));

}

