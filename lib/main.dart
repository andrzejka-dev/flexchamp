import 'package:flexchamp/app/core/injection_container.dart';
import 'package:flexchamp/features/affirmation/cubit/affirmation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; 
import 'app/app.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

void main() async {
WidgetsFlutterBinding.ensureInitialized();

await configureDependencies();

await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
); 
runApp(
    MultiProvider(
      providers: [
        Provider<AffirmationCubit>(
          create: (context) => getIt<AffirmationCubit>(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
