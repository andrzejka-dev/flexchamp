import 'package:flexchamp/data/affirmation_remote_data_source.dart';
import 'package:flexchamp/domain/models/affirmation_model.dart';

class AffirmationRepository {
  AffirmationRepository(this.affirmationRemoteDataSource);
  
  final AffirmationRemoteDioDataSource affirmationRemoteDataSource;
  
  Future<AffirmationModel?> getRandomAffirmation() async {
  try {
    // Get a random affirmation from remote data source
    final response = await affirmationRemoteDataSource.getAffirmation();
    
    if (response == null) {
      return null;
    }
    
    // Convert to model
    return AffirmationModel.fromJson(response);
  } catch (e) {
    // Consider using a proper logging framework instead of print
    // Logger.e('Error fetching affirmation: $e');
    return null;
  }
}
}