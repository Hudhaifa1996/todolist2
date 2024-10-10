import 'package:go_router/go_router.dart';
import 'view/onboarding.dart';
import 'view/splash.dart';
import 'view/home.dart';
import 'view/listedit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Routing {
  static late final SharedPreferences prefs;

// GoRouter configuration
  static final router = GoRouter(
    initialLocation: '/home',
    routes: [
      GoRoute(
        name: 'splash',
        path: '/',
        builder: (context, state) =>  SplashScreen(),
      ),
      GoRoute(
        name: 'onboarding',
        path: '/onboarding',
        builder: (context, state) =>  OnBoarding(),
      ),
      GoRoute(
        name: 'home',
        path: '/home',
        builder: (context, state) =>  Home(),
      ),
      GoRoute(
        name: 'listedit',
        path: '/listedit',
        builder: (context, state) => ListEdit(),
      ),
    ],
  );
}
