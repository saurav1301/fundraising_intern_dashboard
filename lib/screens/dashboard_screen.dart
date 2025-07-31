import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import '../widgets/dashboard_card.dart';
import '../widgets/reward_card.dart';
import '../widgets/shimmer_placeholder.dart';
import '../animations/bounce_on_tap.dart';
import '../utils/constants.dart';
import '../utils/dummy_data.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with TickerProviderStateMixin {
  bool isLoading = true;
  late AnimationController _counterController;
  late Animation<int> _donationCounter;

  @override
  void initState() {
    super.initState();

    // Simulate loading state
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
      _counterController.forward();
    });

    // Donation Counter Animation
    _counterController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _donationCounter = IntTween(begin: 0, end: 5000).animate(
      CurvedAnimation(parent: _counterController, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _counterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Dashboard',
          style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.person_outline), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome, Saurav 👋',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),

            // Total Donations Card
            isLoading
                ? ShimmerPlaceholder(width: double.infinity, height: 80)
                : AnimatedBuilder(
                    animation: _donationCounter,
                    builder: (context, child) {
                      return DashboardCard(
                        title: 'Total Donations',
                        value: '₹${_donationCounter.value}',
                        icon: Icons.volunteer_activism_outlined,
                        backgroundColor: AppColors.primaryBlue,
                      );
                    },
                  ),

            const SizedBox(height: 16),

            // Referral Code Card with Bounce and Copy
            isLoading
                ? ShimmerPlaceholder(width: double.infinity, height: 80)
                : BounceOnTap(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Referral Code Copied!')),
                      );
                    },
                    child: DashboardCard(
                      title: 'Referral Code',
                      value: 'saurav2025',
                      icon: Icons.copy_outlined,
                      backgroundColor: AppColors.primaryGreen,
                    ),
                  ),

            const SizedBox(height: 16),

            // Rewards Progress Bar
            isLoading
                ? ShimmerPlaceholder(width: double.infinity, height: 80)
                : Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [AppShadows.cardShadow],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Progress to Next Reward',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 12,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            Container(
                              width: size.width * 0.6,
                              height: 12,
                              decoration: BoxDecoration(
                                color: AppColors.primaryBlue,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '₹5,000 / ₹10,000',
                          style: GoogleFonts.poppins(fontSize: 14),
                        ),
                      ],
                    ),
                  ),

            const SizedBox(height: 20),

            // Rewards Section
            Text(
              'Unlockable Rewards',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 140,
              child: isLoading
                  ? ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: ShimmerPlaceholder(width: 140, height: 120),
                        );
                      },
                    )
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: dummyRewards.length,
                      itemBuilder: (context, index) {
                        return RewardCard(reward: dummyRewards[index]);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
