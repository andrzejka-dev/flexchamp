import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flexchamp/domain/repositories/figure_repository.dart';
import 'package:flexchamp/features/home/cubit/figure_state.dart';

class FigureCubit extends Cubit<FigureState> {
  FigureCubit(this._figuresRepository) : super(const FigureState());

  final FiguresRepository _figuresRepository;

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    _streamSubscription = _figuresRepository.getFiguresStream().listen(
      (figure) {
        emit(FigureState(figures: figure));
      },
    )..onError(
        (error) {
          emit(const FigureState(loadingErrorOccurred: true, isLoading: false,),);
        },
      );
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}


