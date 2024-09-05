import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({
    super.key,
  });
  
  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper>{
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: const SizedBox(
        width: double.infinity,
        height: double.infinity,
      ), //i think this is the main box
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: Colors.indigo,
        child: const Icon(
          Icons.chat_rounded,
          color: Colors.white,)),
      bottomNavigationBar: Container(
        color: Colors.indigo,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 20),
            child: GNav(
              backgroundColor: Colors.indigo,
              color: Colors.white,
              activeColor: Colors.black87,
              tabBackgroundColor: Colors.indigo.shade50,
              gap: 8,
              padding: const EdgeInsets.all(16),
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
              ]
            ),
          ),
        ),
    );
  }
}