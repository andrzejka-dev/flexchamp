import 'package:bloc_test/bloc_test.dart';
import 'package:flexchamp/app/core/enums.dart';
import 'package:flexchamp/domain/models/figure_model.dart';
import 'package:flexchamp/domain/repositories/figure_repository.dart';
import 'package:flexchamp/features/home/cubit/figure_cubit.dart';
import 'package:flexchamp/features/home/cubit/figure_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFiguresRepository extends Mock implements FiguresRepository {}

void main() {
  late FigureCubit sut;
  late MockFiguresRepository figuresRepository;

  setUp(() {
    figuresRepository = MockFiguresRepository();
    sut = FigureCubit(figuresRepository);
  });

  tearDown(() {
    sut.close();
  });

  group('start', () {
    final testFigures = [
      FigureModel(id: 'figure-1', title: 'Figure 1', figureIcon: 'icon1.png'),
      FigureModel(id: 'figure-2', title: 'Figure 2', figureIcon: 'icon2.png'),
    ];

    test('initial state is correct', () {
      expect(sut.state, equals(const FigureState()));
    });

    blocTest<FigureCubit, FigureState>(
      'emits FigureState with success status when stream emits figures',
      setUp: () {
        when(() => figuresRepository.getFiguresStream()).thenAnswer(
          (_) => Stream<List<FigureModel>>.value(testFigures),
        );
      },
      build: () => sut,
      act: (cubit) => cubit.start(),
      expect: () => [
        FigureState(
          status: Status.success,
          figures: testFigures,
        ),
      ],
      verify: (_) {
        verify(() => figuresRepository.getFiguresStream()).called(1);
      },
    );

    blocTest<FigureCubit, FigureState>(
      'emits FigureState with error status when stream emits error',
      setUp: () {
        when(() => figuresRepository.getFiguresStream()).thenAnswer(
          (_) => Stream<List<FigureModel>>.error('Failed to load figures'),
        );
      },
      build: () => sut,
      act: (cubit) => cubit.start(),
      expect: () => [
        FigureState(
          status: Status.error,
          errorMessage: 'Failed to load figures',
        ),
      ],
      verify: (_) {
        verify(() => figuresRepository.getFiguresStream()).called(1);
      },
    );

    blocTest<FigureCubit, FigureState>(
      'cancels stream subscription when cubit is closed',
      setUp: () {
        // Create a stream that never completes to test subscription cancellation
        when(() => figuresRepository.getFiguresStream()).thenAnswer(
          (_) => Stream<List<FigureModel>>.empty().asBroadcastStream(),
        );
      },
      build: () => sut,
      act: (cubit) {
        cubit.start();
        return cubit.close();
      },
      verify: (_) {
        verify(() => figuresRepository.getFiguresStream()).called(1);
      },
    );

    blocTest<FigureCubit, FigureState>(
      'handles multiple emissions from stream',
      setUp: () {
        // Create a stream that emits multiple values
        when(() => figuresRepository.getFiguresStream()).thenAnswer(
          (_) => Stream<List<FigureModel>>.fromIterable([
            testFigures,
            [...testFigures, FigureModel(id: 'figure-3', title: 'Figure 3')],
          ]),
        );
      },
      build: () => sut,
      act: (cubit) => cubit.start(),
      expect: () => [
        FigureState(
          status: Status.success,
          figures: testFigures,
        ),
        FigureState(
          status: Status.success,
          figures: [
            ...testFigures,
            FigureModel(id: 'figure-3', title: 'Figure 3')
          ],
        ),
      ],
      verify: (_) {
        verify(() => figuresRepository.getFiguresStream()).called(1);
      },
    );
  });
}
