import 'package:flexchamp/domain/models/figure_model.dart';

class FigureState {
  const FigureState({
    this.figures = const [],  // Changed from figure to figures
    this.isLoading = false,  // Added loading state
    this.loadingErrorOccurred = false,
    this.removingErrorOccurred = false,
  });

  final List<FigureModel> figures;  // Changed from figure to figures
  final bool isLoading;
  final bool loadingErrorOccurred;
  final bool removingErrorOccurred;

  // Add copyWith method for easier state updates
  FigureState copyWith({
    List<FigureModel>? figures,
    bool? isLoading,
    bool? loadingErrorOccurred,
    bool? removingErrorOccurred,
  }) {
    return FigureState(
      figures: figures ?? this.figures,
      isLoading: isLoading ?? this.isLoading,
      loadingErrorOccurred: loadingErrorOccurred ?? this.loadingErrorOccurred,
      removingErrorOccurred: removingErrorOccurred ?? this.removingErrorOccurred,
    );
  }
}


