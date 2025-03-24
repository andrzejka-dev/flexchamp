import 'package:flexchamp/features/about/about_widgets/about_page_extract_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  // Function to launch URLs when icons are tapped
  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Text(
                  'About the app',
                  style: GoogleFonts.mulish(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
                        // Logo
                        Container(
                          width: 180,
                          height: 180,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage('images/flexchamp_login.png'),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Version 1.0",
                          style: GoogleFonts.mulish(
                            textStyle: const TextStyle(
                              color: Colors.white70,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        // App description
                        InfoContainer(
                          child: Text(
                            "Designed for all skill levels, our app helps you achieve dream gymnastics moves with proper technique and injury prevention in mind. The road to success has ups and downs, but powerful affirmations will keep you focused and unstoppable on your journey to become the FlexChamp.",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.mulish(
                              textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                height: 1.5,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                        // Social Links Section
                        InfoContainer(
                          child: Column(
                            children: [
                              Text(
                                "Find us on:",
                                style: GoogleFonts.mulish(
                                  textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 14),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  // X (Twitter) icon
                                  SocialIconButton(
                                    icon: FontAwesomeIcons.xTwitter,
                                    label: 'X',
                                    onTap: () => _launchUrl('https://x.com/andrzejka_dev'),
                                  ),
                                  // Google Play icon
                                  SocialIconButton(
                                    icon: FontAwesomeIcons.googlePlay,
                                    label: 'Google Play',
                                    onTap: () => _launchUrl('https://play.google.com/store/apps/details?id=your.package.name'),
                                  ),
                                  // App Store icon
                                  SocialIconButton(
                                    icon: FontAwesomeIcons.appStore,
                                    label: 'App Store',
                                    onTap: () => _launchUrl('https://apps.apple.com/app/yourapp/id12345678'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Rate the app section
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}