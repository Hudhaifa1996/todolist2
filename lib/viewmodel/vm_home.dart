import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:dynamic_shared_preferences/dynamic_shared_preferences.dart';
import 'package:todolists/providers/listprovider.dart';
import 'package:todolists/view/home.dart';
import 'dart:convert';
import 'package:todolists/view/home.dart';
import 'dart:math' as math;

List<int> randomColor = [];
int _n = 0;

class VmHome extends StatefulWidget {
  const VmHome({super.key});

  @override
  State<VmHome> createState() => _VmHomeState();
}

class _VmHomeState extends State<VmHome> {
  @override
  void initState() {
    super.initState();

    _loadList();
    _SaveList();
  }

  Future<void> _loadList() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      if (_n == 0) {
        _n = 1;
        List<String>? min = prefs.getStringList('title');
        List<String>? min2 = prefs.getStringList('description');
        for (var i = 0; i < 10; i++) {
          randomColor.add((math.Random().nextDouble() * 0xFFFFFF).toInt());
        }

        Provider.of<listProvider>(context, listen: false).miniCard1 = min!;
        Provider.of<listProvider>(context, listen: false).miniCard2 = min2!;
      }
    });
  }

  Future<void> _SaveList() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      prefs.setStringList('title',
          Provider.of<listProvider>(context, listen: false).miniCard1!);
      prefs.setStringList('description',
          Provider.of<listProvider>(context, listen: false).miniCard2!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Home();
  }
}
