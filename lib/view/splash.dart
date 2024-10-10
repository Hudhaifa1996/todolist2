import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:todolists/viewmodel/vm_splash.dart';
import 'package:go_router/go_router.dart';
import 'package:todolists/routing.dart';
import 'package:todolists/viewmodel/vm_home.dart';
import 'package:flutter/scheduler.dart';

import '../providers/listprovider.dart';

class SplashScreen extends StatelessWidget {
   SplashScreen({super.key});

   final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // key: myGlobals.scaffoldKey,
      key: _scaffoldKey,

      body: FutureBuilder(
          future: Future.wait ([getNextRoute(Routing.prefs), VmHome(context).fetchData(context)]),
          initialData: 'wait',
          builder: ( context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                // print(snapshot);
                // Navigator.of(context2).pop();
                // Future.delayed(const Duration(milliseconds: 300));
                // GoRouter.of(context).go('${snapshot.data[0]}');
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) =>
                //       ChangeNotifierProvider<ListProvider>.value(
                //         value: Provider.of<ListProvider>(context),
                //         child: snapshot.data[0],
                //       )
                //   ),
                // );
                GoRouter.of(context).go('${snapshot.data[0]}');

                // context.go('${snapshot.data[0]}');
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
