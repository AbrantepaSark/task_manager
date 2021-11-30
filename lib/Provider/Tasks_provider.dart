// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'dart:convert';
//import 'dart:io';
// import 'package:http/http.dart' as http;
//import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import 'task_model.dart';

class Tasks with ChangeNotifier {
  List<Task> tasks = [];
  var uuid = const Uuid();

  Future<void> createTask(
      String title, String des, DateTime date, String time) async {
    //final prefs = await SharedPreferences.getInstance();
    print('here...........');
    final taskData = json.encode({
      "id": uuid.v4(),
      "title": title,
      "description": des,
      "date": date,
      "time": time,
      "createdDate": DateTime.now(),
    });
    print(taskData);
    //prefs.setString("dataKey", taskData);
  }

  void test() {
    print('test working');
  }
}
