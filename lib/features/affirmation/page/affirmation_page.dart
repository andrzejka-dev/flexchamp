import 'package:flexchamp/app/core/enums.dart';
import 'package:flexchamp/features/affirmation/affirmation_widgets.dart/affirmation_page_widgets_extract.dart';
import 'package:flexchamp/features/affirmation/cubit/affirmation_cubit.dart';
import 'package:flexchamp/features/affirmation/cubit/affirmation_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class AffirmationPage extends StatefulWidget {
  const AffirmationPage({super.key});

  @override
  State<AffirmationPage> createState() => _AffirmationPageState();
}

class _AffirmationPageState extends State<AffirmationPage> {
  Color topColor = (Color.fromARGB(255, 121, 93, 165)); 
  Color bottomColor = const Color(0xFFE9A8A2); 
  bool isLoadingPalette = false;
  bool _isMounted = true;

  @override
  void initState() {
    super.initState();
    _isMounted = true;
  }

  @override
  void dispose() {
    _isMounted = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        'Stay Inspired',
        style: GoogleFonts.mulish(
          fontWeight: FontWeight.w600,
          color: Colors.white,
          fontSize: 22,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.white),
    );
  }

  Widget _buildBody() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            topColor,
            bottomColor,
          ],
        ),
      ),
      child: BlocBuilder<AffirmationCubit, AffirmationState>(
        builder: (context, state) {
          return SafeArea(
            child: Center(
              child: switch (state.status) {
                Status.loading => const AffirmationLoadingView(),
                
                Status.success when state.affirmation != null => _buildSuccessContent(context, state),
                
                Status.error => AffirmationErrorView(
                  errorMessage: state.errorMessage,
                  onRetry: () => context.read<AffirmationCubit>().fetchRandomAffirmation(),
                ),
                
                _ => AffirmationInitialView(
                  onGetInspired: () => context.read<AffirmationCubit>().fetchRandomAffirmation(),
                ),
              },
            ),
          );
        },
      ),
    );
  }

  Future<void> _updateBackgroundColors(String imageUrl) async {
    if (isLoadingPalette || !_isMounted) return;
    
    if (_isMounted) {
      setState(() {
        isLoadingPalette = true;
      });
    }
    
    try {
      if (!_isMounted) return;
      
      final colors = await PaletteExtractorService.extractColorsFromImage(imageUrl);
      
      if (!_isMounted) return;
      
      if (_isMounted) {
        setState(() {
          topColor = colors[0];
          bottomColor = colors[1];
          isLoadingPalette = false;
        });
      }
    } catch (e) {
      if (_isMounted) {
        setState(() {
          topColor = const Color(0xFF8563CF);
          bottomColor = const Color(0xFFE390BA);
          isLoadingPalette = false;
        });
      }
    }
  }

  Widget _buildSuccessContent(BuildContext context, AffirmationState state) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_isMounted) {
        _updateBackgroundColors(state.affirmation!.imageUrl);
      }
    });
    
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const SizedBox(height: 20),
          
          AffirmationImageView(
            imageUrl: state.affirmation!.imageUrl,
            width: screenWidth * 0.85,
            height: screenHeight * 0.65,
          ),
          
          const Spacer(),
          
          NextAffirmationButton(
            onPressed: () {
              if (_isMounted) {
                setState(() {
                  topColor = const Color(0xFF8563CF);
                  bottomColor = const Color(0xFFE390BA);
                });
              }
              context.read<AffirmationCubit>().fetchRandomAffirmation();
            },
          ),
        ],
      ),
    );
  }
}