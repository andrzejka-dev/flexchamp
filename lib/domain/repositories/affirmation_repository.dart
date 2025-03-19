import 'dart:math';
import 'package:flexchamp/data/affirmation_remote_data_source.dart';
import 'package:flexchamp/domain/models/affirmation_model.dart';

class AffirmationRepository {
  AffirmationRepository(this.affirmationRemoteDataSource);
  
  final AffirmationRemoteRetrofitDataSource affirmationRemoteDataSource;
  
  Future<AffirmationModel?> getRandomAffirmation() async {
    try {
      // Get all affirmations from remote data source
      final affirmations = await affirmationRemoteDataSource.getAffirmations();
      
      if (affirmations.isEmpty) {
        return null;
      }
      
      // Select a random affirmation
      final randomIndex = Random().nextInt(affirmations.length);
      return affirmations[randomIndex];
    } catch (e) {
      return null;
    }
  }
}