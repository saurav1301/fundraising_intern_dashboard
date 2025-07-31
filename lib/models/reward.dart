// lib/models/reward.dart
import 'package:flutter/material.dart';

class Reward {
  final String title;
  final String description; // <-- Add description field
  final IconData icon;
  final bool isUnlocked;

  Reward({
    required this.title,
    required this.description,
    required this.icon,
    this.isUnlocked = false,
  });
}
