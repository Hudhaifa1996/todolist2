import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:dynamic_shared_preferences/dynamic_shared_preferences.dart';
import 'package:todolists/providers/listprovider.dart';
import 'package:todolists/view/home.dart';
import 'package:todolists/viewmodel/vm_listdetails.dart';
import 'dart:convert';
import 'package:todolists/view/home.dart';
//
// Future<void> saveMiniCardList(List<MiniCard> MiniCards) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   List<String> jsonStringList = MiniCards.map((MiniCard) => jsonEncode(MiniCard.toJson())).toList();
//   await prefs.setStringList('MiniCard_list', jsonStringList);
// }
//
// Future<List<MiniCard>> getMiniCardList() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   List<String>? jsonStringList = prefs.getStringList('MiniCard_list');
//
//   if (jsonStringList != null) {
//     return jsonStringList.map((jsonString) => MiniCard.fromJson(jsonDecode(jsonString))).toList();
//   }
//   return [];
// }
// final SharedPreferences prefs;
//
// Future<void> saveMiniCardList(List<String> miniCards) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   await prefs.setStringList('MiniCard_list', miniCards);
// }

// List cardInfo = Provider.of<listProvider>(context, listen: false).getTitle;
// List<String>? miniCards2 = prefs.getStringList('MiniCard_list');
int _n = 0;

class VmHome extends StatefulWidget {
  const VmHome({super.key});
  // load() => createState()._loadList();

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


  /// Load the initial counter value from persistent storage on start,
  /// or fallback to 0 if it doesn't exist.
  Future<void> _loadList() async {
    final prefs = await SharedPreferences.getInstance();
    // print(_min);

    setState(() {

      if (_n==0) {
        _n=1;
        List<String>? min = prefs.getStringList('title');
        List<String>? min2 = prefs.getStringList('description');

        // print(_n);
        // _min = min!;
        // _min2 = min2!;

        Provider
            .of<listProvider>(context, listen: false)
            .miniCard1 = min!;
        Provider
            .of<listProvider>(context, listen: false)
            .miniCard2 = min2!;
        // print('min is $min');
        // print('min2 is $min2');

      }

      // print( ' is $_min');
      // print(_min);
      // print( prefs.getStringList('slist'));
      // print(' provider is ${Provider.of<listProvider>(context, listen: false).miniCard2}');
      // print(Provider.of<listProvider>(context, listen: false).getCard);


    });
  }

  /// After a click, increment the counter state and
  /// asynchronously save it to persistent storage.
  Future<void> _SaveList() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      prefs.setStringList('title', Provider.of<listProvider>(context, listen: false).miniCard1!);
      prefs.setStringList('description', Provider.of<listProvider>(context, listen: false).miniCard2!);

      // print('this is save $_min');
      // print('this is save2 $_min2');

      // _min = prefs.getStringList('slist';

    });
  }

  @override
  Widget build(BuildContext context) {
    return Home();
  }
}
