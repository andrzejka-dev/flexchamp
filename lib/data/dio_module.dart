import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppInfrastructureModule {
  @singleton
  Dio get dio => Dio();
}