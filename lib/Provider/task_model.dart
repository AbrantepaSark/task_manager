import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Task with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final String date;
  final String time;
  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.time,
  });
}
