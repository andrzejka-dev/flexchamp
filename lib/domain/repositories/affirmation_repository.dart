import 'package:flexchamp/data/affirmation_remote_data_source.dart';
import 'package:flexchamp/domain/models/affirmation_model.dart';

class AffirmationRepository {
  AffirmationRepository(this._affirmationRemoteDataSource);
  final AffirmationRemoteDataSource _affirmationRemoteDataSource;
  

 
  Future<AffirmationModel?> getAffirmations({required String imageUrl}) async {
    final json = await _affirmationRemoteDataSource.getAffirmationData(imageUrl: imageUrl,);
    if (json == null) {
      return null;
    }

    return AffirmationModel.fromJson(json);
  }
}
