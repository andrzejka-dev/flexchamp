import 'package:bloc_test/bloc_test.dart';
import 'package:flexchamp/app/core/enums.dart';
import 'package:flexchamp/domain/models/affirmation_model.dart';
import 'package:flexchamp/domain/repositories/affirmation_repository.dart';
import 'package:flexchamp/features/affirmation/cubit/affirmation_cubit.dart';
import 'package:flexchamp/features/affirmation/cubit/affirmation_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAffirmationRepository extends Mock implements AffirmationRepository {}

void main() {
  late AffirmationCubit sut;
  late MockAffirmationRepository affirmationRepository;

  setUp(() {
    affirmationRepository = MockAffirmationRepository();
    sut = AffirmationCubit(affirmationRepository);
  });

    group('fetchRandomAffirmation', () {
    final testAffirmation = AffirmationModel(
      id: 1, 
      imageUrl: 'https://raw.githubusercontent.com/andrzejka-dev/Affirmations/refs/heads/main/Affirmation1.png'
    );

    test('initial state is correct', () {
      expect(sut.state, equals(const AffirmationState()));
    });

    blocTest<AffirmationCubit, AffirmationState>(
      'emits [loading, success] when repository returns an affirmation',
      setUp: () {
        when(() => affirmationRepository.getRandomAffirmation())
            .thenAnswer((_) async => testAffirmation);
      },
      build: () => sut,
      act: (cubit) => cubit.fetchRandomAffirmation(),
      expect: () => [
        const AffirmationState(status: Status.loading),
        AffirmationState(
          status: Status.success,
          affirmation: testAffirmation,
        ),
      ],
      verify: (_) {
        verify(() => affirmationRepository.getRandomAffirmation()).called(1);
      },
    );

    blocTest<AffirmationCubit, AffirmationState>(
      'emits [loading, error] when repository returns null',
      setUp: () {
        when(() => affirmationRepository.getRandomAffirmation())
            .thenAnswer((_) async => null);
      },
      build: () => sut,
      act: (cubit) => cubit.fetchRandomAffirmation(),
      expect: () => [
        const AffirmationState(status: Status.loading),
        const AffirmationState(
          status: Status.error,
          errorMessage: 'Failed to load affirmation',
        ),
      ],
      verify: (_) {
        verify(() => affirmationRepository.getRandomAffirmation()).called(1);
      },
    );

    blocTest<AffirmationCubit, AffirmationState>(
      'emits [loading, error] when repository throws an exception',
      setUp: () {
        when(() => affirmationRepository.getRandomAffirmation())
            .thenThrow(Exception('Network error'));
      },
      build: () => sut,
      act: (cubit) => cubit.fetchRandomAffirmation(),
      expect: () => [
        const AffirmationState(status: Status.loading),
        AffirmationState(
          status: Status.error,
          errorMessage: 'Exception: Network error',
        ),
      ],
      verify: (_) {
        verify(() => affirmationRepository.getRandomAffirmation()).called(1);
      },
    );
  });
}