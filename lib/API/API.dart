import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';

import '../providers/listprovider.dart';

class API {
  bool _isFetched = true;
  bool _isLoaded = true;
  List<dynamic> titleData = [];
  List<dynamic> descriptionData = [];
  String error = '';
  Map<String, String> requestHeaders = {'Content-Type': 'application/json'};
  Map<String, String> saveBody = {
    "todo": 'hooooooooooooz',
    "completed": "false",
    "userId": "555",
  };

  Map<String, String> descriptionBody = {
    "content": "",
    "branch": "main",
    "commit_message": "saving"
  };

  Future<void> fetchData() async {
    try {
      final fetchResponse =
          await Dio().get('https://dummyjson.com/todos?limit=0');

      if (fetchResponse.statusCode == 200) {
        // titleData = jsonDecode(utf8
        //     .decode(base64.decode(json.decode(titleResponse.body)['content'])));
        // descriptionData = jsonDecode(utf8.decode(
        //     base64.decode(json.decode(descriptionResponse.body)['content'])));
        // // (context as Element).markNeedsBuild();
        // Provider.of<ListProvider>(context, listen: false).setTitles(titleData);
        // Provider.of<ListProvider>(context, listen: false).setDescriptions(descriptionData);

        print('Load success');
        print(fetchResponse.data);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      error = 'Load Error: $e';
      print(error);
    }
  }

  Future<void> saveData() async {
    try {
      // if (_isLoaded == true) {
      //   await Future.delayed(const Duration(seconds: 3));
      //   _isLoaded = false;
      // // }
      // titleBody["content"] = json.encode(
      //     Provider.of<ListProvider>(context, listen: false)
      //         .getTitles); //.replaceAll(' ', '+');
      // descriptionBody["content"] = json.encode(
      //     Provider.of<ListProvider>(context, listen: false)
      //         .getDescriptions); //.replaceAll(' ', '+');
      final saveResponse = await Dio().post('https://dummyjson.com/todos/add',
          data: saveBody, options: Options(headers: requestHeaders));

      if (saveResponse.statusCode == 200) {
        print('Save success');
        print(saveResponse.data);
      } else {
        throw Exception('Failed to save data');
      }
    } catch (e) {
      error = 'Save Error: $e';
      print(error);
    }
  }
}
