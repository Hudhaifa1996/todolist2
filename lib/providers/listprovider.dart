import 'package:flutter/material.dart';

class ListProvider extends ChangeNotifier {
  late bool isOneButton;
  late TextEditingController myController;
  late TextEditingController myController2;
  List<int> randomColor = [];
  List<dynamic> titles = [];
  List<dynamic> descriptions = [];

  int index = 0;

  List<dynamic> get getTitles => titles;

  List<dynamic> get getDescriptions => descriptions;

  saveTitle(String title, String description) {
    titles.add(title);
    descriptions.add(description);
    notifyListeners();
  }

  editTitle(String title, String description) {
    titles[index] = title;
    descriptions[index] = description;
    notifyListeners();
  }

  deleteTitle() {
    titles.removeAt(index);
    descriptions.removeAt(index);
    notifyListeners();
  }
}
