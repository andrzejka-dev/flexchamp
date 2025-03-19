import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flexchamp/app/core/enums.dart';
import 'package:flexchamp/domain/repositories/figure_repository.dart';
import 'package:flexchamp/features/home/cubit/figure_state.dart';

class FigureCubit extends Cubit<FigureState> {
  FigureCubit(this._figuresRepository) : super(const FigureState());

  final FiguresRepository _figuresRepository;

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    _streamSubscription = _figuresRepository.getFiguresStream().listen(
      (figure) {
        emit(FigureState(
          figures: figure,
          status: Status.success,
        ));
      },
    )..onError(
        (error) {
          // Emit error state with error message
          emit(FigureState(
            status: Status.error,
            errorMessage: error.toString(),
          ));
        },
      );
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}


