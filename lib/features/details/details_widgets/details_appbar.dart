import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  
  const DetailsAppBar({
    super.key,
    required this.title,
  });
  
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      leading: BackButton(),
      leadingWidth: 50, // Provide enough space for the arrow and text
      title: Text(
        title,
        style: GoogleFonts.montserrat(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 28,
        ),
      ),
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class BackButton extends StatelessWidget {
  const BackButton({super.key});
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pop(),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Icon(Icons.arrow_back,
             color: Colors.white, 
             size: 28),
          ),
        ],
      ),
    );
  }
}