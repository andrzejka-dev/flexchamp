
import 'package:flexchamp/domain/repositories/figure_repository.dart';
import 'package:flexchamp/features/auth/auth_gate.dart';
import 'package:flexchamp/features/home/cubit/figure_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FigureCubit(FiguresRepository())..start(),
        ),
      //   BlocProvider(create: (context) => RootCubit()..start(),
      //   child: BlocBuilder<RootCubit, RootState>(
      //     builder: (context, state) => 
            
      //       if (currentUser == null) {
      //         return AuthGate();
      //     }
      //     return HomePage(user: user);
      //   ),),
      ],
      child: MaterialApp(
        title: 'Flexchamp',
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''),
          Locale('pl', ''),
        ],
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const AuthGate(),
      ),
    );
  }
}
