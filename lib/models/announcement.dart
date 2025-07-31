import 'package:flutter/material.dart';

class Announcement {
  final String title;
  final String message;
  final String date;
  final Color typeColor;

  Announcement({
    required this.title,
    required this.message,
    required this.date,
    required this.typeColor,
  });
}
