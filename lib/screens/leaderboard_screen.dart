import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/constants.dart';
import '../models/leaderboard_entry.dart';
import '../utils/dummy_data.dart';
import '../widgets/leaderboard_tile.dart';
import '../animations/animated_podium_card.dart'; // <-- AnimatedPodiumCard
import '../animations/animated_leaderboard_tile.dart'; // <-- NEW AnimatedLeaderboardTile

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        title: Text(
          'Leaderboard',
          style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Top Fundraisers',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),

            // Podium Top 3 with Animation
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AnimatedPodiumCard(
                  entry: dummyLeaderboard[1],
                  rank: 2,
                  badgeColor: AppColors.primaryGreen,
                  delay: const Duration(milliseconds: 300),
                ), // Silver
                AnimatedPodiumCard(
                  entry: dummyLeaderboard[0],
                  rank: 1,
                  badgeColor: AppColors.primaryBlue,
                  delay: const Duration(milliseconds: 500),
                ), // Gold
                AnimatedPodiumCard(
                  entry: dummyLeaderboard[2],
                  rank: 3,
                  badgeColor: AppColors.primaryOrange,
                  delay: const Duration(milliseconds: 700),
                ), // Bronze
              ],
            ),
            const SizedBox(height: 30),

            // Ranks 4 and 5 List with Slide + Fade Animation
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: dummyLeaderboard.length - 3,
              itemBuilder: (context, index) {
                return AnimatedLeaderboardTile(
                  entry: dummyLeaderboard[index + 3],
                  rank: index + 4,
                  delay: Duration(milliseconds: 900 + (index * 200)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
