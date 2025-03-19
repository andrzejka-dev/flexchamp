import 'package:flexchamp/app/core/enums.dart';
import 'package:flexchamp/domain/models/figure_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'figure_state.freezed.dart';

@freezed
class FigureState with _$FigureState {
  const factory FigureState({
    @Default([]) List<FigureModel> figures,
    @Default(Status.initial) Status status,
    String? errorMessage,
  }) = _FigureState;
}


