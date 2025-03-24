import 'package:flexchamp/app/core/injection_container.dart';
import 'package:flexchamp/features/affirmation/cubit/affirmation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'env.dart'; 
import 'app/app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();

  await Firebase.initializeApp(
    options: Env.currentPlatformOptions,
  ); 
  
  runApp(
    BlocProvider(
      create: (context) => getIt<AffirmationCubit>(),
      child: const MyApp(),
    ),
  );
}
