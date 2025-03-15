import 'dart:math';
import 'package:dio/dio.dart';



class AffirmationRemoteDioDataSource {
  Future<Map<String, dynamic>?> getAffirmation() async {
    try {
      final response = await Dio().get<List<dynamic>>(
        'https://andrzejka-dev.github.io/Affirmations/affirmations.json');
      final listDynamic = response.data;

      if (listDynamic == null) {
        return null;
      }
      
      // Select a random element from the list
      final randomIndex = Random().nextInt(listDynamic.length);
      return listDynamic[randomIndex] as Map<String, dynamic>;
      
    } on DioException catch (error) {
      throw Exception(error.response?.data['error']['message'] ?? 'Unknown error');
    }
  }
}
