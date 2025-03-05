import 'package:dio/dio.dart';


class AffirmationRemoteDataSource {
  Future<Map<String, dynamic>?> getAffirmationData({
    required String imageUrl,
  }) async {
    try {
      final response = await Dio().get<Map<String, dynamic>>(
        'https://andrzejka-dev.github.io/Affirmations/affirmations.json');
    return response.data;
    } on DioException catch (error) {
      throw Exception(error.response?.data['error']['message'] ?? ['Unknown error']);
    }
  }
}
