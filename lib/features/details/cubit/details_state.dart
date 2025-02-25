import 'package:flexchamp/app/core/enums.dart';
import 'package:flexchamp/domain/models/detail_model.dart';


class DetailsState {
  const DetailsState({
    this.figures = const [],
    this.status = Status.initial,
    this.errorMessage = '',
  });

  final List<DetailModel> figures;
  final Status status;
  final String errorMessage;

  DetailsState copyWith({
    List<DetailModel>? figures,
    Status? status,
    String? errorMessage,
  }) {
    return DetailsState(
      figures: figures ?? this.figures,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
