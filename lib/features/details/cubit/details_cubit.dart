import 'dart:async';
import 'package:flexchamp/app/core/enums.dart';
import 'package:flexchamp/domain/repositories/details_repository.dart';
import 'package:flexchamp/features/details/cubit/details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class DetailsCubit extends Cubit<DetailsState> {
DetailsCubit(this._detailsRepository) : super(const DetailsState());

  final DetailsRepository _detailsRepository;

  StreamSubscription? _streamSubscription;

Future<void> getDetails(String title) async {
    emit(DetailsState(status: Status.loading),);
    
try {
      _streamSubscription = _detailsRepository.getFigureDetails(title).listen(
        (figure) {
          emit(
            DetailsState(
              status: Status.success,
              figures: figure,
            ),
          );
        },
      );
      
      _streamSubscription?.onError((error) {
        emit(
          DetailsState(
            status: Status.error,
            errorMessage: error.toString(),
          ),
        );
      });
    } catch (error) {
      emit(
        DetailsState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}

