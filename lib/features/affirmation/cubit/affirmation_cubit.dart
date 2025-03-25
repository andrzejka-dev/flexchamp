import 'package:bloc/bloc.dart';
import 'package:flexchamp/app/core/enums.dart';
import 'package:flexchamp/domain/repositories/affirmation_repository.dart';
import 'package:flexchamp/features/affirmation/cubit/affirmation_state.dart';
import 'package:flexchamp/services/palette_extractor_service.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class AffirmationCubit extends Cubit<AffirmationState> {
  AffirmationCubit(this.affirmationRepository)
      : super(const AffirmationState());

  final AffirmationRepository affirmationRepository;

  // Default gradient colors
  static const List<Color> defaultGradientColors = [
    Color.fromARGB(255, 121, 93, 165),
    Color(0xFF9D7BCA),
    Color(0xFFA77CB2),
    Color(0xFFB683A8),
    Color(0xFFE9A8A2),
  ];

  static const List<double> defaultGradientStops = [0.0, 0.25, 0.5, 0.75, 1.0];

  Future<void> fetchRandomAffirmation() async {
    emit(
      const AffirmationState(
        status: Status.loading,
      ),
    );

    try {
      final affirmation = await affirmationRepository.getRandomAffirmation();

      if (affirmation == null) {
        emit(
          const AffirmationState(
            status: Status.error,
            errorMessage: 'Failed to load affirmation',
          ),
        );
        return;
      }

      emit(
        AffirmationState(
          status: Status.success,
          affirmation: affirmation,
        ),
      );
      _updateGradientColors(affirmation.imageUrl);
    } catch (error) {
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
      final colors =
          await PaletteExtractorService.extractColorsFromImage(imageUrl);

      // Create a new gradient
      final List<Color> newGradient = [
        colors[0],
        Color.lerp(colors[0], colors[1], 0.25)!,
        Color.lerp(colors[0], colors[1], 0.5)!,
        Color.lerp(colors[0], colors[1], 0.75)!,
        colors[1],
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
