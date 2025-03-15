//import 'package:flexchamp/app/core/injection_container.dart';
import 'package:flexchamp/data/affirmation_remote_data_source.dart';
import 'package:flexchamp/domain/repositories/affirmation_repository.dart';
import 'package:flexchamp/features/affirmation/cubit/affirmation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; 
import 'app/app.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

void main() async {
WidgetsFlutterBinding.ensureInitialized();
//configureDependencies();
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
); 
runApp(
    MultiProvider(
      providers: [
        // Provide AffirmationRepository at the app level
        Provider<AffirmationCubit>(
          create: (context) => AffirmationCubit(
          AffirmationRepository(AffirmationRemoteDioDataSource()),
          ),
        ),
        // Add any other app-level providers here
      ],
      child: const MyApp(),
    ),
  );
}
