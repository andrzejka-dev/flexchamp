import 'package:flexchamp/app/core/enums.dart';
import 'package:flexchamp/domain/models/figure_model.dart';

class FigureState {
  const FigureState({
    this.figures = const [],  
    this.status = Status.initial,  
    this.errorMessage = '',
  });

  final List<FigureModel> figures;  // Changed from figure to figures
  final Status status;
  final String? errorMessage;

  // Add copyWith method for easier state updates
  FigureState copyWith({
     List<FigureModel>? figures,
    Status? status,
    String? errorMessage,
  }) {
    return FigureState(
      figures: figures ?? this.figures,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}


