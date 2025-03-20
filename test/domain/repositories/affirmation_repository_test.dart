import 'package:flexchamp/data/affirmation_remote_data_source.dart';
import 'package:flexchamp/domain/repositories/affirmation_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAffirmationDataSource extends Mock implements AffirmationRemoteRetrofitDataSource {}
void main() {
  late AffirmationRepository sut;
  late MockAffirmationDataSource dataSource;

  setUp(() {
    dataSource = MockAffirmationDataSource();
    sut = AffirmationRepository(dataSource);
  });

  group('getRandomAffirmation', () {
    test('should call remoteDataSource.getAffirmations() method', () async {
      // Arrange
      when(() => dataSource.getAffirmations()).thenAnswer((_) async => []);
      // Act
      await sut.getRandomAffirmation();
      // Assert
      verify(() => dataSource.getAffirmations()).called(1);
    });
  });
}
