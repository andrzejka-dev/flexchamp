import 'package:dio/dio.dart';


class AffirmationRemoteDataSource {
  Future<Map<String, dynamic>?> getAffirmationData({
    required String imageUrl,
  }) async {
    final response = await Dio().get<Map<String, dynamic>>(
        'https://andrzejka-dev.github.io/Affirmations/affirmations.json');
    return response.data;
  }
}
