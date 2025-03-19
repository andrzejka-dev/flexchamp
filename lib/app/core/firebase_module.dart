// lib/app/core/external_modules.dart
import 'package:injectable/injectable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';

@module
abstract class ExternalModule {
  @singleton
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;
  
  @singleton
  FirebaseFirestore get firebaseFirestore => FirebaseFirestore.instance;
  
  @singleton
  Dio get dio => Dio();
}