import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/announcement.dart';
import '../utils/dummy_data.dart';
import '../widgets/announcement_card.dart';
import '../widgets/typewriter_text.dart'; // <-- Import TypewriterText

class AnnouncementsScreen extends StatelessWidget {
  const AnnouncementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        title: Text(
          'Announcements',
          style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w600),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        itemCount: dummyAnnouncements.length,
        itemBuilder: (context, index) {
          return AnnouncementCard(
            announcement: dummyAnnouncements[index],
            // Pass index for staggered delay
            animationDelay: Duration(milliseconds: index * 200),
          );
        },
      ),
    );
  }
}
