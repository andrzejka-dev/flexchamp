import 'package:flexchamp/app/core/config.dart';
import 'package:flexchamp/features/admin/storage_update_screen.dart';
import 'package:flexchamp/features/auth/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
  });
  
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(Config.helloMessage,
        //'Welcome to FlexChamp!',
        style: GoogleFonts.mulish(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold
        ),
      ),
      actions: [
        // Admin button
        if (Config.isAdminEnabled)
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const StorageUpdateScreen(),
                ),
              );
            },
            icon: const Icon(Icons.admin_panel_settings, color: Colors.white),
            tooltip: 'Admin Tools',
          ),
        // User profile button
        IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const UserProfileScreen(),
              ),
            );
          },
          icon: const Icon(Icons.person, color: Colors.white),
        ),
      ],
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}