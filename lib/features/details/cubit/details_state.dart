import 'package:flexchamp/app/core/enums.dart';
import 'package:flexchamp/domain/models/detail_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'details_state.freezed.dart';
@freezed
class DetailsState with _$DetailsState {
  const factory DetailsState({
    @Default([]) List<DetailModel> figures,
    @Default(Status.initial) Status status,
    @Default('') String errorMessage,
  }) = _DetailsState;
}
