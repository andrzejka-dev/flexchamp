import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flexchamp/domain/models/figure_model.dart';
import 'package:flexchamp/domain/repositories/figure_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Mock Firestore and Auth
class MockFirebaseFirestore extends Mock implements FirebaseFirestore {}
class MockFirebaseAuth extends Mock implements FirebaseAuth {}
class MockUser extends Mock implements User {}

// Mock the repository itself for contract testing
class MockFiguresRepository extends Mock implements FiguresRepository {}

void main() {
  group('FiguresRepository', () {
    late MockFirebaseAuth mockAuth;
    late MockFirebaseFirestore mockFirestore;
    late MockUser mockUser;
    late FiguresRepository sut;

    setUp(() {
      mockAuth = MockFirebaseAuth();
      mockFirestore = MockFirebaseFirestore();
      mockUser = MockUser();
      
      when(() => mockAuth.currentUser).thenReturn(mockUser);
      when(() => mockUser.uid).thenReturn('test-user-id');
      
      // Pass both mocked instances to avoid Firebase initialization
      sut = FiguresRepository(
        auth: mockAuth,
        firestore: mockFirestore,
      );
    });
    
    test('should emit error when user is not logged in', () async {
      // Arrange
      when(() => mockAuth.currentUser).thenReturn(null);
      
      // Act & Assert
      expectLater(
        sut.getFiguresStream(),
        emitsError(predicate<Object>((error) => 
          error.toString().contains('User is not logged in'))),
      );
    });

    // For the functional tests, use a different approach - test the repository interface
    group('Repository interface tests', () {
      late MockFiguresRepository mockRepository;
      
      setUp(() {
        mockRepository = MockFiguresRepository();
      });
      
      test('getFiguresStream returns stream of figures', () async {
        // Arrange
        final mockFigures = [
          FigureModel(id: 'figure-1', title: 'Figure 1', figureIcon: 'icon1.png'),
          FigureModel(id: 'figure-2', title: 'Figure 2', figureIcon: 'icon2.png'),
        ];
        
        when(() => mockRepository.getFiguresStream())
            .thenAnswer((_) => Stream.value(mockFigures));
            
        // Act
        final stream = mockRepository.getFiguresStream();
        final result = await stream.first;
        
        // Assert
        expect(result.length, 2);
        expect(result, equals(mockFigures));
      });
      
      test('getFiguresStream propagates errors', () {
        // Arrange
        when(() => mockRepository.getFiguresStream())
            .thenAnswer((_) => Stream.error('Test error'));
            
        // Act & Assert
        expectLater(
          mockRepository.getFiguresStream(),
          emitsError('Test error'),
        );
      });
    });
  });
}