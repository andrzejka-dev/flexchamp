import 'dart:ui';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flexchamp/app/core/enums.dart';
import 'package:flexchamp/domain/models/affirmation_model.dart';
import 'package:flutter/material.dart';

part 'affirmation_state.freezed.dart';

@freezed
class AffirmationState with _$AffirmationState {
  const factory AffirmationState({
    AffirmationModel? affirmation,
    @Default(Status.initial) Status status,
    @Default('') String errorMessage,
    @Default([
      Color.fromARGB(255, 121, 93, 165),
      Color(0xFF9D7BCA),
      Color(0xFFA77CB2),
      Color(0xFFB683A8),
      Color(0xFFE9A8A2),
    ]) List<Color> gradientColors,
    @Default([0.0, 0.25, 0.5, 0.75, 1.0]) List<double> gradientStops,
    @Default(false) bool isLoadingPalette,
  }) = _AffirmationState;
}
