import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final User currentUser;
  final int currentIndex;
  final Function(int) onProfileTap;
  final Function(int) onAboutTap;
  
  const BottomNavBar({
    required this.currentUser,
    this.currentIndex = 0,
    required this.onProfileTap,
    required this.onAboutTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFE9A8A2), Color(0xFFF5B8C1)], 
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent, 
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        currentIndex: currentIndex,
        elevation: 0,  
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          if (index == 1) {
            onProfileTap(index);
          } else if (index == 2) {
            onAboutTap(index);
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: 'About',
          ),
        ],
      ),
    );
  }
}