import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:flexchamp/domain/models/affirmation_model.dart';

part 'affirmation_remote_data_source.g.dart';

@injectable
@RestApi(baseUrl: 'https://andrzejka-dev.github.io/Affirmations/')
abstract class AffirmationRemoteRetrofitDataSource {
  factory AffirmationRemoteRetrofitDataSource(Dio dio, {String baseUrl}) = _AffirmationRemoteRetrofitDataSource;

@GET('/affirmations.json')
Future<List<AffirmationModel>> getAffirmations();
}
