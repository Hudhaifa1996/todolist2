import 'package:flutter/material.dart';
import 'package:todolists/main.dart';
import 'package:todolists/providers/listprovider.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

class MiniCard
{
  String title='';
  String description='';
  MiniCard ( this.title,  this.description);
  //
  //
  // factory MiniCard.fromJson(Map<String, dynamic> json) {
  //   return MiniCard(
  //     title: json['title'],
  //     description: json['description'],
  //   );
  // }
  //
  // Map<String, dynamic> toJson() {
  //   return {
  //     'title': title,
  //     'description': description,
  //   };
  // }
}
