
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolists/viewmodel/vm_onboarding.dart';
import "dart:io";

// class Pref
// {
//   String routeText = '';
//   Pref (bool repeat)
//   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   {
//
//   }
// }
// print(prefs.getBool('repeat'));
// if (prefs.getBool('repeat') == false)
// {Navigator.pushReplacementNamed(context, '/home');}
// else
// {Navigator.pushReplacementNamed(context, '/onboarding');}
//
Future<String> Pref() async {

// Task<String> Pref(String routeText) async {
String routeText;
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  // var haystack = await File(path).readAsString();
// print (prefs.getBool('repeat'));
  if (prefs.getBool('repeat') == false)
  { routeText = 'home';}
  else
  {routeText = 'onboarding';}

  // print (routeText);
  return routeText; }

// Future<String> PrefCard2() async {
// // Task<String> Pref(String routeText) async {
// //   String routeText;
// //   String hoz = ''
//   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   final hoz = prefs.getString('cardInfo');
//   return hoz;
// }
// Future<String> Pref () async
// {
// String routeText = '';
// final SharedPreferences prefs = await SharedPreferences.getInstance();
// // prefs.getBool('repeat');
// if (prefs.getBool('repeat') == false)
//  { routeText = 'home';}
// else
//   {routeText = 'onboarding';}
// return routeText;
// }