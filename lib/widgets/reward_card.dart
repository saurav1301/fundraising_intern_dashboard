import 'package:flutter/material.dart';
import '../models/reward.dart';
import '../utils/constants.dart';

class RewardCard extends StatefulWidget {
  final Reward reward;

  const RewardCard({super.key, required this.reward});

  @override
  State<RewardCard> createState() => _RewardCardState();
}

class _RewardCardState extends State<RewardCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _flipAnimation;
  bool isFront = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _flipAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  void _flipCard() {
    if (isFront) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    isFront = !isFront;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.reward.isUnlocked ? _flipCard : null,
      child: Container(
        width: 140,
        margin: const EdgeInsets.only(right: 16),
        child: AnimatedBuilder(
          animation: _flipAnimation,
          builder: (context, child) {
            final isBack = _flipAnimation.value >= 0.5;
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(_flipAnimation.value * 3.1416),
              child: isBack ? _buildBackSide() : _buildFrontSide(),
            );
          },
        ),
      ),
    );
  }

  Widget _buildFrontSide() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: widget.reward.isUnlocked
            ? AppColors.primaryGreen
            : Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
        boxShadow: [AppShadows.cardShadow],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            widget.reward.icon,
            size: 40,
            color: widget.reward.isUnlocked ? Colors.white : Colors.grey,
          ),
          const SizedBox(height: 10),
          Text(
            widget.reward.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: widget.reward.isUnlocked ? Colors.white : Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackSide() {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()..rotateY(3.1416),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.primaryGreen,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [AppShadows.cardShadow],
        ),
        child: Center(
          child: Text(
            widget.reward.description,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
