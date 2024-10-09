import 'package:provider/provider.dart';
import 'package:todolists/providers/listprovider.dart';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

bool _isFetched = true;
bool _isLoaded = true;

class VmHome {
  List<int> randomColor = [];
  List<dynamic> titleData = [];
  List<dynamic> descriptionData = [];
  String error = '';

  Map<String, String> requestHeaders = {
    'PRIVATE-TOKEN': 'glpat-4nLoQ37mKzBfZpanmLvi'
  };
  Map<String, String> titleBody = {
    "content": "",
    "branch": "main",
    "commit_message": "saving"
  };

  Map<String, String> descriptionBody = {
    "content": "",
    "branch": "main",
    "commit_message": "saving"
  };

  VmHome(context) {
    if (_isFetched == true) {
      for (var i = 0; i < 100; i++) {
        randomColor.add((math.Random().nextDouble() * 0xFFFFFF).toInt());
      }
      Provider.of<ListProvider>(context, listen: false).setRandomColor(randomColor);

      _isFetched = false;
    }
    saveData(context);
  }

  Future<void> fetchData(context) async {
    try {
      final titleResponse = await http.get(
          Uri.parse(
              'https://gitlab.com/api/v4/projects/62245073/repository/files/Hudhaifa%2Ftitle%2Etxt?ref=main'),
          headers: requestHeaders);
      final descriptionResponse = await http.get(
          Uri.parse(
              'https://gitlab.com/api/v4/projects/62245073/repository/files/Hudhaifa%2Fdescription%2Etxt?ref=main'),
          headers: requestHeaders);

      if (titleResponse.statusCode == 200 &&
          descriptionResponse.statusCode == 200) {
        titleData = jsonDecode(utf8
            .decode(base64.decode(json.decode(titleResponse.body)['content'])));
        descriptionData = jsonDecode(utf8.decode(
            base64.decode(json.decode(descriptionResponse.body)['content'])));
        // (context as Element).markNeedsBuild();
        Provider.of<ListProvider>(context, listen: false).setTitles(titleData);
        Provider.of<ListProvider>(context, listen: false).setDescriptions(descriptionData);

        print('Load success');
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      error = 'Error: $e';
      print(error);
    }
  }

  Future<void> saveData(context) async {
    try {
      if (_isLoaded == true) {
        await Future.delayed(const Duration(seconds: 3));
        _isLoaded = false;
      }
      titleBody["content"] = json.encode(
          Provider.of<ListProvider>(context, listen: false)
              .getTitles); //.replaceAll(' ', '+');
      descriptionBody["content"] = json.encode(
          Provider.of<ListProvider>(context, listen: false)
              .getDescriptions); //.replaceAll(' ', '+');
      final titleResponse = await http.put(
          Uri.parse(
              'https://gitlab.com/api/v4/projects/62245073/repository/files/Hudhaifa%2Ftitle%2Etxt?ref=main'),
          headers: requestHeaders,
          body: titleBody);
      final descriptionResponse = await http.put(
          Uri.parse(
              'https://gitlab.com/api/v4/projects/62245073/repository/files/Hudhaifa%2Fdescription%2Etxt?ref=main'),
          headers: requestHeaders,
          body: descriptionBody);

      if (titleResponse.statusCode == 200 &&
          descriptionResponse.statusCode == 200) {
        print('Save success');
      } else {
        throw Exception('Failed to save data');
      }
    } catch (e) {
      error = 'Error: $e';
      print(error);
    }
  }
}
