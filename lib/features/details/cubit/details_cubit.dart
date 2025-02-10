import 'dart:async';
import 'package:flexchamp/domain/repositories/details_repository.dart';
import 'package:flexchamp/features/details/cubit/details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class DetailsCubit extends Cubit<DetailsState> {
DetailsCubit(this._detailsRepository) : super(const DetailsState());

  final DetailsRepository _detailsRepository;

  StreamSubscription? _streamSubscription;

Future<void> getDetails(String figureType) async {
    _streamSubscription?.cancel();
    
    _streamSubscription = _detailsRepository.getFigureDetails(figureType).listen(
      (figures) {
        emit(DetailsState(
          figures: figures,
          isLoading: false,
        ));
      },
    )..onError(
        (error) {
          emit(const DetailsState(
            loadingErrorOccurred: true,
            isLoading: false,
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

