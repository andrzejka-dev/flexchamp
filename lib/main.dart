import 'package:flexchamp/app/core/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; 
import 'app/app.dart';

void main() async {
WidgetsFlutterBinding.ensureInitialized();
configureDependencies();
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
); 
  runApp(const MyApp());
}
