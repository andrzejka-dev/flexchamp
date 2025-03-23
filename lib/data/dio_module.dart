// lib/app/core/dio_module.dart
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppInfrastructureModule {
  // Provide a simple Dio instance without any configuration
  @singleton
  Dio get dio => Dio();
}