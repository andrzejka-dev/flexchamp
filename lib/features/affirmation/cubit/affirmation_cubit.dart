import 'package:bloc/bloc.dart';
import 'package:flexchamp/app/core/enums.dart';
import 'package:flexchamp/domain/models/affirmation_model.dart';
import 'package:flexchamp/domain/repositories/affirmation_repository.dart';

part 'affirmation_state.dart';

class AffirmationCubit extends Cubit<AffirmationState> {
  AffirmationCubit(this.affirmationRepository) : super(AffirmationState());

  final AffirmationRepository affirmationRepository;

  Future<void> fetchRandomAffirmation() async {
    emit(
      const AffirmationState(
        status: Status.loading,
      ),
    );
    
    try {
      final affirmation = await affirmationRepository.getRandomAffirmation();
      
      if (affirmation == null) {
        emit(
          const AffirmationState(
            status: Status.error,
            errorMessage: 'Failed to load affirmation',
          ),
        );
        return;
      }
      
      emit(
        AffirmationState(
          status: Status.success,
          affirmation: affirmation,
        ),
      );
    } catch (error) {
      emit(
        AffirmationState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
