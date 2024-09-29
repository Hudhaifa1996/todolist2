import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolists/viewmodel/vm_splash.dart';

class SplashScreen extends StatelessWidget {
  final SharedPreferences prefs;

  const SplashScreen({super.key, required this.prefs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getNextRoute(prefs),
          initialData: 'wait',
          builder: (context, AsyncSnapshot<String> data) {
            if (data.connectionState == ConnectionState.done) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.pushReplacementNamed(context, '${data.data}');
              });
            }
            return const Center(
                child: SpinKitPouringHourGlassRefined(
              color: Colors.redAccent,
              size: 300.0,
            ));
          }),
    );
  }
}
