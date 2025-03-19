import 'package:bloc/bloc.dart';
import 'package:flexchamp/app/core/enums.dart';
import 'package:flexchamp/domain/repositories/affirmation_repository.dart';
import 'package:flexchamp/features/affirmation/cubit/affirmation_state.dart';
import 'package:injectable/injectable.dart';

@injectable
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
