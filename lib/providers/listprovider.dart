import 'package:flutter/material.dart';

class ListProvider extends ChangeNotifier {
  late int buttonsNo;
  late TextEditingController myController;
  late TextEditingController myController2;
  List<int> randomColor = [];
  List<String>? miniCard1 = [];
  List<String>? miniCard2 = [];

  int index = 0;

  List<String>? get getCard1 => miniCard1;

  List<String>? get getCard2 => miniCard2;

  saveTitle(String title, String description) {
    miniCard1!.add(title);
    miniCard2!.add(description);
    notifyListeners();
  }

  editTitle(String title, String description) {
    miniCard1![index] = title;
    miniCard2![index] = description;
    notifyListeners();
  }

  deleteTitle() {
    miniCard1!.removeAt(index);
    miniCard2!.removeAt(index);
    notifyListeners();
  }
}
