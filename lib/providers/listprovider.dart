import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolists/viewmodel/vm_home.dart';
import 'package:todolists/viewmodel/vm_splash.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

// import 'dart:convert';




// import 'package:todolists/viewmodel/vm_listdetails.dart';
class listProvider extends ChangeNotifier {
  List<int> randomColor = [];
  List<String>? miniCard1 = [];
  List<String>? miniCard2 = [];
  // print('mimicars is $miniCard2');
  String _title = "";
String _description = "";

  int index = 0;
  // print(index);
  // List  cardInfo = []; //jsonDecode(PrefCard2());
  // Future <List>  cardInfo = PrefCard2();
  // = [];
  // print(PrefCard2()); //PrefCard2();

// print(cardInfo);
  List<String>? get getCard1 => miniCard1;

  List<String>? get getCard2 => miniCard2;
  // Future<String> Pref2() async {
//
//     final DynamicSharedPreferences gen = DynamicSharedPreferences();
//     List cardInfo = await gen.get(key: 'cardInfo', isModel: true);
//
// // // Task<String> Pref(String routeText) async {
// //     String routeText;
// //     final DynamicSharedPreferences gen = DynamicSharedPreferences();
//   }
  // DynamicSharedPreferences gen2 = DynamicSharedPreferences();
 //[];// DynamicSharedPreferences().get(key: 'cardInfo', isModel: true); //gen.get(key: 'cardInfo', isModel: true);
 //  List get getTitle => cardInfo; // [_title, _description];
  // String get getDescription => _description;
  // cardInfo.add(getTitle);


    saveTitle(String title, String description) {
    _title = title;
    _description = description;
    // cardInfo.add([title, description]);
    miniCard1!.add(title);
    miniCard2!.add(description);

    // cardInfo[index] = [title, description];
    // print (cardInfo);

    // cardInfo[0] = [title, description];
    // print(cardInfo);
    // print(cardInfo);
    // print(cardInfo[0]);

    notifyListeners();
  }
  // List get getEdit => cardInfo; // [_title, _description];
  editTitle(String title, String description) {
    _title = title;
    _description = description;
    // cardInfo[index] = [title, description];
    miniCard1![index]= title;
    miniCard2![index]= description;
    // print(cardInfo[0]);
    // print(cardInfo);
    notifyListeners();
  }
  deleteTitle() {
    miniCard1!.removeAt(index);
    miniCard2!.removeAt(index);

    notifyListeners();
  }
}