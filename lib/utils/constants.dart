import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryBlue = Color(0xFF3B82F6); // Gold
  static const Color primaryGreen = Color(0xFF10B981); // Silver
  static const Color primaryOrange = Color(0xFFF97316); // Bronze (Added)
}

class AppShadows {
  static BoxShadow cardShadow = BoxShadow(
    color: Colors.black12,
    blurRadius: 8,
    offset: Offset(0, 4),
  );
}
