// lib/app/core/dio_injection.dart
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

void configureDioInjection(GetIt getIt) {
  // Register Dio as a singleton
  if (!getIt.isRegistered<Dio>()) {
    getIt.registerSingleton<Dio>(Dio());
  }
}