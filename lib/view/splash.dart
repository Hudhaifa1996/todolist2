import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:todolists/viewmodel/vm_splash.dart';
import 'package:go_router/go_router.dart';
import 'package:todolists/routing.dart';
import 'package:todolists/viewmodel/vm_home.dart';
import 'package:flutter/scheduler.dart';
//
// class SplashScreen extends StatelessWidget {
//    SplashScreen({super.key});
//
//    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
// bool isLoading = true;
//   @override
// void didChangeDependencies (){
//     if (isLoading) {VmHome(context).fetchData(context);
//     isLoading = false;
//     }
//     super.didChangeDependencies ()
//   };
//    Widget build(BuildContext context) {
//     return Scaffold(
//       // key: myGlobals.scaffoldKey,
//       key: _scaffoldKey,
//
//       body: FutureBuilder(
//           future: Future.wait ([getNextRoute(Routing.prefs),  VmHome(context).fetchData(context)]),
//           initialData: 'wait',
//           builder: ( context2, AsyncSnapshot<dynamic> snapshot) {
//             if (snapshot.connectionState == ConnectionState.done) {
//               WidgetsBinding.instance.addPostFrameCallback((_) {
//                 // print(snapshot);
//                 // Navigator.of(context2).pop();
//                 if (context2.mounted) {Future.delayed(Duration.zero).then ((value){context2.go('${snapshot.data[0]}');});}
//                 // Future.delayed(Duration.zero).then ((value){}); //(const Duration(milliseconds: 300));
//                 // GoRouter.of(context).go('${snapshot.data[0]}');
//                 // GoRouter.of(context)
//
//                 // context.go('${snapshot.data[0]}');
//               });
//             }
//             return const Center(
//                 child: SpinKitPouringHourGlassRefined(
//               color: Colors.redAccent,
//               size: 300.0,
//             ));
//           }),
//     );
//   }
// }


class SplashScreen extends StatefulWidget {
   SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool isLoading = true;
  @override
  void didChangeDependencies (){
    if (isLoading) {VmHome(context).fetchData(context);
    isLoading = false;
    }
    super.didChangeDependencies ();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: myGlobals.scaffoldKey,
      key: _scaffoldKey,

      body: FutureBuilder(
          future: getNextRoute(Routing.prefs),
          initialData: 'wait',
          builder: ( context2, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                print(snapshot);
                // Navigator.of(context2).pop();
                // context.go('${snapshot.data}');
                if (context.mounted) {context.go('${snapshot.data[0]}');}
                // Future.delayed(Duration.zero).then ((value){}); //(const Duration(milliseconds: 300));
                // GoRouter.of(context).go('${snapshot.data[0]}');
                // GoRouter.of(context)

                // context.go('${snapshot.data[0]}');
              });
            }
            return const Center(
                child: SpinKitPouringHourGlassRefined(
                  color: Colors.redAccent,
                  size: 300.0,
                ));
          }),
    );;
  }
}
