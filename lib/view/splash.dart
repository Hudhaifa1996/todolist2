import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:todolists/viewmodel/vm_splash.dart';
import 'package:go_router/go_router.dart';
import 'package:todolists/routing.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getNextRoute(Routing.prefs),
          initialData: 'wait',
          builder: (context, AsyncSnapshot<String> data) {
            if (data.connectionState == ConnectionState.done) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                context.go('${data.data}');
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
