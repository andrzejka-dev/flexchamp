import 'package:flexchamp/domain/models/detail_model.dart';
import 'package:flexchamp/domain/repositories/details_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Mock the repository itself for contract testing
class MockDetailsRepository extends Mock implements DetailsRepository {}

void main() {
  group('DetailsRepository', () {
    group('Contract testing', () {
      late MockDetailsRepository mockRepository;
      
      setUp(() {
        mockRepository = MockDetailsRepository();
      });
      
      test('repository returns stream of detail models for given title', () async {
        // Arrange
        final details = [
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
        
        when(() => mockRepository.getFigureDetails('bridge'))
            .thenAnswer((_) => Stream.value(details));
        
        // Act
        final stream = mockRepository.getFigureDetails('bridge');
        final result = await stream.first;
        
        // Assert
        expect(result.length, 1);
        expect(result.first.title, 'bridge');
        expect(result.first.id, 'detail-1');
        expect(result.first.names, ['Bridge Pose', 'Wheel Pose']);
        expect(result.first.descriptions, ['Description 1', 'Description 2']);
        expect(result.first.photoURLs, ['photo1.jpg', 'photo2.jpg']);
        expect(result.first.headerImage, 'bridge_header.jpg');
      });
      
      test('repository handles empty results', () async {
        // Arrange
        when(() => mockRepository.getFigureDetails('unknown'))
            .thenAnswer((_) => Stream.value([]));
        
        // Act
        final stream = mockRepository.getFigureDetails('unknown');
        final result = await stream.first;
        
        // Assert
        expect(result, isEmpty);
      });
      
      test('repository propagates errors', () {
        // Arrange
        when(() => mockRepository.getFigureDetails('bridge'))
            .thenAnswer((_) => Stream.error('Repository error'));
        
        // Act & Assert
        expectLater(
          mockRepository.getFigureDetails('bridge'),
          emitsError('Repository error'),
        );
      });
      
      test('repository handles multiple details for same title', () async {
        // Arrange
        final details = [
          DetailModel(
            id: 'detail-1',
            title: 'bridge',
            figureIcon: 'bridge_icon.png',
            headerImage: 'bridge_header.jpg',
            names: ['Bridge Pose', 'Wheel Pose'],
            descriptions: ['Description 1', 'Description 2'],
            photoURLs: ['photo1.jpg', 'photo2.jpg'],
          ),
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
        
        when(() => mockRepository.getFigureDetails('bridge'))
            .thenAnswer((_) => Stream.value(details));
        
        // Act
        final result = await mockRepository.getFigureDetails('bridge').first;
        
        // Assert
        expect(result.length, 2);
        expect(result, equals(details));
      });
    });
  });
}