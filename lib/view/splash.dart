import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:todolists/viewmodel/vm_onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolists/viewmodel/vm_splash.dart';
class Splash extends StatefulWidget {
  const Splash({super.key});
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

void loading () async {
  // SharedPreferences.setMockInitialValues({});
  String pref = await Pref();
  // print ('pref is $pref');
  await Future.delayed(Duration(seconds: 2), () {});
  Navigator.pushReplacementNamed(context, '/$pref');

}
@override
void initState () {
  super.initState();

  loading ();

}
@override
Widget build(BuildContext context) {
  return Scaffold(
    body: //Text(prefs.getBool('repeat')),

    Center(child: SpinKitPouringHourGlassRefined(
      color: Colors.redAccent,
      size: 300.0,
    ),),
  );
}
}

