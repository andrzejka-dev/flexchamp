import 'package:bloc_test/bloc_test.dart';
import 'package:flexchamp/app/core/enums.dart';
import 'package:flexchamp/domain/models/detail_model.dart';
import 'package:flexchamp/domain/repositories/details_repository.dart';
import 'package:flexchamp/features/details/cubit/details_cubit.dart';
import 'package:flexchamp/features/details/cubit/details_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDetailsRepository extends Mock implements DetailsRepository {}

void main() {
  late DetailsCubit sut;
  late MockDetailsRepository detailsRepository;

  setUp(() {
    detailsRepository = MockDetailsRepository();
    sut = DetailsCubit(detailsRepository);
  });

  tearDown(() {
    sut.close();
  });

  group('getDetails', () {
    final testDetails = [
      DetailModel(
        id: 'detail-1',
        title: 'bridge',
        figureIcon: 'bridge_icon.png',
        headerImage: 'bridge_header.jpg',
        names: ['Bridge Pose', 'Wheel Pose'],
        descriptions: ['Description 1', 'Description 2'],
        photoURLs: ['photo1.jpg', 'photo2.jpg'],
      ),
    ];

    test('initial state is correct', () {
      expect(sut.state, equals(const DetailsState()));
    });

    blocTest<DetailsCubit, DetailsState>(
      'emits [loading, success] when details are loaded successfully',
      setUp: () {
        when(() => detailsRepository.getFigureDetails('bridge'))
            .thenAnswer((_) => Stream<List<DetailModel>>.value(testDetails));
      },
      build: () => sut,
      act: (cubit) => cubit.getDetails('bridge'),
      expect: () => [
        const DetailsState(status: Status.loading),
        DetailsState(
          status: Status.success,
          figures: testDetails,
        ),
      ],
      verify: (_) {
        verify(() => detailsRepository.getFigureDetails('bridge')).called(1);
      },
    );

    blocTest<DetailsCubit, DetailsState>(
      'emits [loading, error] when repository stream emits error',
      setUp: () {
        when(() => detailsRepository.getFigureDetails('bridge'))
            .thenAnswer((_) => Stream<List<DetailModel>>.error('Failed to load details'));
      },
      build: () => sut,
      act: (cubit) => cubit.getDetails('bridge'),
      expect: () => [
        const DetailsState(status: Status.loading),
        DetailsState(
          status: Status.error,
          errorMessage: 'Failed to load details',
        ),
      ],
      verify: (_) {
        verify(() => detailsRepository.getFigureDetails('bridge')).called(1);
      },
    );

    blocTest<DetailsCubit, DetailsState>(
      'emits [loading, error] when repository throws exception',
      setUp: () {
        when(() => detailsRepository.getFigureDetails('bridge'))
            .thenThrow(Exception('Repository exception'));
      },
      build: () => sut,
      act: (cubit) => cubit.getDetails('bridge'),
      expect: () => [
        const DetailsState(status: Status.loading),
        DetailsState(
          status: Status.error,
          errorMessage: 'Exception: Repository exception',
        ),
      ],
      verify: (_) {
        verify(() => detailsRepository.getFigureDetails('bridge')).called(1);
      },
    );

    blocTest<DetailsCubit, DetailsState>(
      'cancels stream subscription when cubit is closed',
      setUp: () {
        // Create a stream that never completes to test subscription cancellation
        when(() => detailsRepository.getFigureDetails('bridge'))
            .thenAnswer((_) => Stream<List<DetailModel>>.empty().asBroadcastStream());
      },
      build: () => sut,
      act: (cubit) {
        cubit.getDetails('bridge');
        return cubit.close();
      },
      verify: (_) {
        verify(() => detailsRepository.getFigureDetails('bridge')).called(1);
      },
    );

    blocTest<DetailsCubit, DetailsState>(
      'handles multiple emissions from repository stream',
      setUp: () {
        final secondEmission = [
          ...testDetails,
          DetailModel(
            id: 'detail-2',
            title: 'bridge',
            figureIcon: 'bridge_icon2.png',
            headerImage: 'bridge_header2.jpg',
            names: ['Advanced Bridge'],
            descriptions: ['Advanced description'],
            photoURLs: ['advanced.jpg'],
          ),
        ];
        
        when(() => detailsRepository.getFigureDetails('bridge'))
            .thenAnswer((_) => Stream<List<DetailModel>>.fromIterable([
                  testDetails,
                  secondEmission,
                ]));
      },
      build: () => sut,
      act: (cubit) => cubit.getDetails('bridge'),
      expect: () => [
        const DetailsState(status: Status.loading),
        DetailsState(
          status: Status.success,
          figures: testDetails,
        ),
        DetailsState(
          status: Status.success,
          figures: [
            testDetails.first,
            DetailModel(
              id: 'detail-2',
              title: 'bridge',
              figureIcon: 'bridge_icon2.png',
              headerImage: 'bridge_header2.jpg',
              names: ['Advanced Bridge'],
              descriptions: ['Advanced description'],
              photoURLs: ['advanced.jpg'],
            ),
          ],
        ),
      ],
      verify: (_) {
        verify(() => detailsRepository.getFigureDetails('bridge')).called(1);
      },
    );
  });
}