import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/leaderboard_entry.dart';

class AnimatedPodiumCard extends StatefulWidget {
  final LeaderboardEntry entry;
  final int rank;
  final Color badgeColor;
  final Duration delay;

  const AnimatedPodiumCard({
    super.key,
    required this.entry,
    required this.rank,
    required this.badgeColor,
    required this.delay,
  });

  @override
  _AnimatedPodiumCardState createState() => _AnimatedPodiumCardState();
}

class _AnimatedPodiumCardState extends State<AnimatedPodiumCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    );

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    Future.delayed(widget.delay, () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: widget.rank == 1 ? 38 : 32,
                  backgroundColor: widget.badgeColor.withOpacity(0.2),
                ),
                CircleAvatar(
                  radius: widget.rank == 1 ? 32 : 26,
                  backgroundColor: widget.badgeColor,
                  child: Text(
                    widget.entry.initials,
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              widget.entry.name,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '₹${widget.entry.donationAmount}',
              style: GoogleFonts.poppins(fontSize: 12, color: Colors.black54),
            ),
            Container(
              margin: const EdgeInsets.only(top: 6),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: widget.badgeColor.withOpacity(0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '#${widget.rank}',
                style: TextStyle(
                  color: widget.badgeColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
