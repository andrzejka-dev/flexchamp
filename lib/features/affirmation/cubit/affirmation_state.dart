part of 'affirmation_cubit.dart';

class AffirmationState {
  const AffirmationState({
    this.affirmation = const [],
    this.status = Status.initial,
    this.errorMessage = '',
  });

  final List<AffirmationModel> affirmation;
  final Status status;
  final String errorMessage;

  AffirmationState copyWith({
    List<AffirmationModel>? affirmation,
    Status? status,
    String? errorMessage,
  }) {
    return AffirmationState(
      affirmation: affirmation ?? this.affirmation,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}