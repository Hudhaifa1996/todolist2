import 'package:provider/provider.dart';
import 'package:todolists/providers/listprovider.dart';
import 'dart:math' as math;
import "package:todolists/routing.dart";

int _n = 0;

class VmHome {
  List<int> randomColor = [];

  VmHome(context) {
    if (_n == 0) {
      _n = 1;
      for (var i = 0; i < 100; i++) {
        randomColor.add((math.Random().nextDouble() * 0xFFFFFF).toInt());
      }
      Provider.of<ListProvider>(context, listen: false).randomColor =
          randomColor;
      loadList(context);
    }
    saveList(context);
  }

  void loadList(context) {
    List<String>? min = Routing.prefs.getStringList('title');
    List<String>? min2 = Routing.prefs.getStringList('description');
    Provider.of<ListProvider>(context, listen: false).miniCard1 = min!;
    Provider.of<ListProvider>(context, listen: false).miniCard2 = min2!;
  }

  void saveList(context) {
    Routing.prefs.setStringList(
        'title', Provider.of<ListProvider>(context, listen: false).miniCard1!);
    Routing.prefs.setStringList('description',
        Provider.of<ListProvider>(context, listen: false).miniCard2!);
  }
}
