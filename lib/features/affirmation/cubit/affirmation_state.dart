import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flexchamp/app/core/enums.dart';
import 'package:flexchamp/domain/models/affirmation_model.dart';

part 'affirmation_state.freezed.dart';

@freezed
class AffirmationState with _$AffirmationState {
  const factory AffirmationState({
    AffirmationModel? affirmation,
    @Default(Status.initial) Status status,
    @Default('') String errorMessage,
  }) = _AffirmationState;
}
