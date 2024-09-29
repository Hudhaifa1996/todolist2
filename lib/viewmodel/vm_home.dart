import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:todolists/providers/listprovider.dart';
import 'dart:math' as math;
int _n=0;
class VmHome {
  List<int> randomColor = [];
  final SharedPreferences prefs;
  VmHome (this.prefs, context) {
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
