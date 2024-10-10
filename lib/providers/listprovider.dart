import 'package:flutter/material.dart';

class ListProvider extends ChangeNotifier {
  late bool isOneButton;
  late TextEditingController myController;
  late TextEditingController myController2;
  List<int> _randomColor = [];
  List<dynamic> _titles = [];
  List<dynamic> _descriptions = [];

  int index = 0;
  void setRandomColor(List<int> randomColor) {
    _randomColor = randomColor;
    // notifyListeners();
  }
  void setTitles(List<dynamic> titles) {
    _titles = titles;
    // notifyListeners();
  }
  void setDescriptions(List<dynamic> descriptions) {
    _descriptions = descriptions;
    // notifyListeners();
  }
  List<int> get getRandomColor => _randomColor;

  List<dynamic> get getTitles => _titles;

  List<dynamic> get getDescriptions => _descriptions;

  saveTitle(String title, String description) {
    _titles.add(title);
    _descriptions.add(description);
    notifyListeners();
  }

  editTitle(String title, String description) {
    _titles[index] = title;
    _descriptions[index] = description;
    notifyListeners();
  }

  deleteTitle() {
    _titles.removeAt(index);
    _descriptions.removeAt(index);
    notifyListeners();
  }
}
