import 'package:flutter/material.dart';

class Event {
  final String title;
  final String category;
  final DateTime date;
  final TimeOfDay time;
  final String location;

  Event({
    required this.title,
    required this.category,
    required this.date,
    required this.time,
    required this.location,
  });
}
