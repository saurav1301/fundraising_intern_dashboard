import 'package:flutter/material.dart';

class RewardUnlockAnimation extends StatefulWidget {
  final Widget child;
  final bool isUnlocked;

  const RewardUnlockAnimation({
    super.key,
    required this.child,
    required this.isUnlocked,
  });

  @override
  State<RewardUnlockAnimation> createState() => _RewardUnlockAnimationState();
}

class _RewardUnlockAnimationState extends State<RewardUnlockAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _shineAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _shineAnimation = Tween<double>(
      begin: -1.0,
      end: 2.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    if (widget.isUnlocked) {
      _controller.repeat(reverse: false);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white.withOpacity(0.0),
                Colors.white.withOpacity(0.4),
                Colors.white.withOpacity(0.0),
              ],
              stops: const [0.3, 0.5, 0.7],
              transform: SlideTransform(_shineAnimation.value),
            ).createShader(bounds);
          },
          child: widget.child,
          blendMode: BlendMode.srcATop,
        );
      },
    );
  }
}

// Custom GradientTransform to Slide Gradient
class SlideTransform extends GradientTransform {
  final double slidePercent;

  SlideTransform(this.slidePercent);

  @override
  Matrix4 transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(bounds.width * slidePercent, 0, 0);
  }
}
