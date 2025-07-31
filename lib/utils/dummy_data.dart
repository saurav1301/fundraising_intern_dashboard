import 'package:flutter/material.dart';
import '../models/reward.dart';
import '../models/leaderboard_entry.dart';
import '../models/announcement.dart';

// Dummy Rewards Data
final List<Reward> dummyRewards = [
  Reward(
    title: 'NGO Badge',
    description: 'An official NGO supporter badge for your profile.',
    icon: Icons.emoji_events,
    isUnlocked: true, // Already Unlocked
  ),
  Reward(
    title: 'T-Shirt',
    description:
        'A branded T-shirt as a token of appreciation. Wear it proudly as a fundraiser!',
    icon: Icons.checkroom,
    isUnlocked: false, // Locked initially
  ),
  Reward(
    title: 'Certificate',
    description:
        'A verified certificate recognizing your valuable contribution to the NGO.',
    icon: Icons.school_outlined,
    isUnlocked: false, // Locked initially
  ),
];

// Dummy Leaderboard Data
final List<LeaderboardEntry> dummyLeaderboard = [
  LeaderboardEntry(name: 'Saurav Negi', initials: 'SN', donationAmount: 5000),
  LeaderboardEntry(name: 'Aarav Gupta', initials: 'AG', donationAmount: 4500),
  LeaderboardEntry(name: 'Meera Shah', initials: 'MS', donationAmount: 4000),
  LeaderboardEntry(name: 'Priya Verma', initials: 'PV', donationAmount: 3500),
  LeaderboardEntry(name: 'Rahul Singh', initials: 'RS', donationAmount: 3000),
];

// Dummy Announcements Data
final List<Announcement> dummyAnnouncements = [
  Announcement(
    title: 'Fundraising Target Increased!',
    message:
        'The NGO has raised the target to ₹50,000 to support more children.',
    date: '29th July 2025',
    typeColor: Colors.blue,
  ),
  Announcement(
    title: 'New Reward Unlocked',
    message: 'Interns who cross ₹10,000 will receive an official NGO T-Shirt.',
    date: '28th July 2025',
    typeColor: Colors.green,
  ),
  Announcement(
    title: 'Urgent: Submit Reports',
    message:
        'Please submit your weekly reports by Friday to avoid disqualification.',
    date: '27th July 2025',
    typeColor: Colors.red,
  ),
];
