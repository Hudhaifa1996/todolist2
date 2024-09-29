import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:todolists/providers/listprovider.dart';
import 'package:todolists/view/home.dart';
import 'dart:convert';
import 'dart:math' as math;
//
// int _n = 0;
//
// class VmHome extends StatefulWidget {
//   const VmHome({super.key});
//
//   @override
//   State<VmHome> createState() => _VmHomeState();
// }
//
// class _VmHomeState extends State<VmHome> {
//   @override
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Home();
//   }
// }

int _n=0;
class VmHome2 {
  List<int> randomColor = [];
  final SharedPreferences prefs;
  VmHome2 (this.prefs, context) {
    if (_n==0) {
      _n=1;
      for (var i = 0; i < 100; i++) {
        randomColor.add((math.Random().nextDouble() * 0xFFFFFF).toInt());
      }
      Provider
          .of<listProvider>(context, listen: false)
          .randomColor = randomColor;
      _loadList(prefs, context);
    }
    _SaveList(prefs, context);
  }
  void _loadList(SharedPreferences prefs, context) {
        List<String>? min = prefs.getStringList('title');
        List<String>? min2 = prefs.getStringList('description');
        Provider.of<listProvider>(context, listen: false).miniCard1 = min!;
        Provider.of<listProvider>(context, listen: false).miniCard2 = min2!;

    }


  void _SaveList(SharedPreferences prefs, context) {
      prefs.setStringList('title',
          Provider.of<listProvider>(context, listen: false).miniCard1!);
      prefs.setStringList('description',
          Provider.of<listProvider>(context, listen: false).miniCard2!);
  }
}
