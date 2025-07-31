import 'package:flutter/material.dart';
import '../models/leaderboard_entry.dart';
import '../widgets/leaderboard_tile.dart';

class AnimatedLeaderboardTile extends StatefulWidget {
  final LeaderboardEntry entry;
  final int rank;
  final Duration delay;

  const AnimatedLeaderboardTile({
    super.key,
    required this.entry,
    required this.rank,
    required this.delay,
  });

  @override
  State<AnimatedLeaderboardTile> createState() =>
      _AnimatedLeaderboardTileState();
}

class _AnimatedLeaderboardTileState extends State<AnimatedLeaderboardTile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

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
    return SlideTransition(
      position: _slideAnimation,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: LeaderboardTile(entry: widget.entry, rank: widget.rank),
      ),
    );
  }
}
