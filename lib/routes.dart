import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/leaderboard_screen.dart';
import 'screens/announcements_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => const LoginScreen(),
  '/dashboard': (context) => const DashboardScreen(),
  '/leaderboard': (context) => const LeaderboardScreen(),
  '/announcements': (context) => const AnnouncementsScreen(),
};
