import 'package:bloc/bloc.dart';
import 'package:flexchamp/app/core/enums.dart';
import 'package:flexchamp/domain/repositories/affirmation_repository.dart';
import 'package:flexchamp/features/affirmation/cubit/affirmation_state.dart';
import 'package:flexchamp/services/palette_extractor_service.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class AffirmationCubit extends Cubit<AffirmationState> {
  AffirmationCubit(this.affirmationRepository) : super(const AffirmationState());
  
  final AffirmationRepository affirmationRepository;
  
  // Default gradient colors
  static const List<Color> defaultGradientColors = [
    Color.fromARGB(255, 121, 93, 165),
    Color(0xFF9D7BCA),
    Color(0xFFA77CB2),
    Color(0xFFB683A8),
    Color(0xFFE9A8A2),
  ];
  
  // Default gradient stops
  static const List<double> defaultGradientStops = [0.0, 0.25, 0.5, 0.75, 1.0];
  
  Future<void> fetchRandomAffirmation() async {
    // Enter loading state
    emit(
      const AffirmationState(
        status: Status.loading,
      ),
    );
    
    try {
      final affirmation = await affirmationRepository.getRandomAffirmation();
      
      if (affirmation == null) {
        // Emit error state
        emit(
          const AffirmationState(
            status: Status.error,
            errorMessage: 'Failed to load affirmation',
          ),
        );
        return;
      }
      
      // Emit success state
      emit(
        AffirmationState(
          status: Status.success,
          affirmation: affirmation,
        ),
      );
      
      // Start extracting colors after emitting success state
      _updateGradientColors(affirmation.imageUrl);
    } catch (error) {
      // Emit error state with the error message
      emit(
        AffirmationState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }
  
  Future<void> _updateGradientColors(String imageUrl) async {
    if (state.isLoadingPalette) return;
    
    // Set palette loading state
    emit(
      AffirmationState(
        status: state.status,
        affirmation: state.affirmation,
        errorMessage: state.errorMessage,
        isLoadingPalette: true,
      ),
    );
    
    try {
      final colors = await PaletteExtractorService.extractColorsFromImage(imageUrl);
      
      // Create a new gradient based on extracted colors
      final List<Color> newGradient = [
        colors[0],                                   // Start with the first extracted color
        Color.lerp(colors[0], colors[1], 0.25)!,     // 25% blend
        Color.lerp(colors[0], colors[1], 0.5)!,      // 50% blend
        Color.lerp(colors[0], colors[1], 0.75)!,     // 75% blend
        colors[1],                                   // End with the second extracted color
      ];
      
      // Set new colors
      emit(
        AffirmationState(
          status: state.status,
          affirmation: state.affirmation,
          errorMessage: state.errorMessage,
          gradientColors: newGradient,
          gradientStops: defaultGradientStops,
          isLoadingPalette: false,
        ),
      );
    } catch (e) {
      // If color extraction fails, reset to default colors
      emit(
        AffirmationState(
          status: state.status,
          affirmation: state.affirmation,
          errorMessage: state.errorMessage,
          gradientColors: defaultGradientColors,
          gradientStops: defaultGradientStops,
          isLoadingPalette: false,
        ),
      );
    }
  }
}