import 'package:flexchamp/domain/models/figure_model.dart';

class FigureState {
  const FigureState({
    this.figure = const [],
    this.loadingErrorOccured = false,
    this.removingErrorOccured = false,
  });

  final List<FigureModel> figure;
  final bool loadingErrorOccured;
  final bool removingErrorOccured;
}


// abstract class FigureState extends Equatable {
//   const FigureState();

//   @override
//   List<Object> get props => [];
// }

// class FigureInitial extends FigureState {}

// class FigureLoading extends FigureState {}

// class FigureLoaded extends FigureState {
//   final List<FigureModel>figure;

//   const FigureLoaded(this.figure);

//   @override
//   List<Object> get props => [figure];
// }

// class FigureError extends FigureState {
//   final String message;

//   const FigureError(this.message);

//   @override
//   List<Object> get props => [message];
// }