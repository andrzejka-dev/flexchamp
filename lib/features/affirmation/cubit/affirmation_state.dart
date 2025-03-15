part of 'affirmation_cubit.dart';

class AffirmationState {
  const AffirmationState({
    this.affirmation,
    this.status = Status.initial,
    this.errorMessage = '',
  });

  final AffirmationModel? affirmation;
  final Status status;
  final String errorMessage;
}
