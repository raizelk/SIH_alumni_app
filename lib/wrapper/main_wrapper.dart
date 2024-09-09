import 'package:alumni_app_2/screen3_events/event_home.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:alumni_app_2/screens/HomeScreen/home_screen.dart';
import 'package:alumni_app_2/screen2_jobPortal/job_home_screen.dart';
import 'package:alumni_app_2/screen4_donation/Donationpage1.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int selectedIndex = 0;

  // Pages for navigation (you can add more pages as needed)
  final List<Widget> pages = [
    const HomeScreen(), // Home Screen
    const Center(child: Text("Directory Screen")), // Dummy Directory Screen
    const JobHomeScreen(),
    EventPage(),
    DonationPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],  // Display the currently selected page
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.indigo,
        child: const Icon(
          Icons.chat_rounded,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.indigo,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
            backgroundColor: Colors.indigo,
            color: Colors.white,
            activeColor: Colors.black87,
            tabBackgroundColor: Colors.indigo.shade50,
            gap: 8,
            padding: const EdgeInsets.all(16),
            selectedIndex: selectedIndex,
            onTabChange: (index) {
              setState(() {
                selectedIndex = index;  // Update the selected index
              });
            },
            tabs: const [
              GButton(
                icon: Icons.home_rounded,
                text: 'Home',
              ),
              GButton(
                icon: Icons.badge_rounded,
                text: 'Directory',
              ),
              GButton(
                icon: Icons.business_center_rounded,
                text: 'Job Portal',
              ),
              GButton(
                icon: Icons.diversity_1_rounded,
                text: 'Donation',
              ),
              GButton(
                icon: Icons.event,
                text: 'Events',
              ),
            ],
          ),
        ),
      ),
    );
  }
}