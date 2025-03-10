import 'package:bloc/bloc.dart';
import 'package:flexchamp/app/core/enums.dart';
import 'package:flexchamp/domain/models/affirmation_model.dart';
import 'package:flexchamp/domain/repositories/affirmation_repository.dart';

part 'affirmation_state.dart';

class AffirmationCubit extends Cubit<AffirmationState> {
  final AffirmationRepository _repository;

  AffirmationCubit({required AffirmationRepository repository}) 
      : _repository = repository,
        super(const AffirmationState());

  Future<void> getRandomAffirmation() async {
    emit(state.copyWith(status: Status.loading));
    
    try {
      // Using a placeholder value since the actual URL comes from the JSON response
      final affirmation = await _repository.getAffirmations(imageUrl: 'placeholder');
      
      if (affirmation != null) {
        emit(state.copyWith(
          affirmation: [affirmation], // Replace the list with the new affirmation
          status: Status.initial,
        ));
      } else {
        emit(state.copyWith(
          status: Status.error,
          errorMessage: 'Failed to load affirmation',
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        status: Status.error,
        errorMessage: e.toString(),
      ));
    }
  }
  
  Future<void> resetAffirmations() async {
    emit(const AffirmationState());
  }
}
