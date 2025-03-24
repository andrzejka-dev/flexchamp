import 'package:flexchamp/app/core/config.dart';
import 'package:flexchamp/app/core/injection_container.dart';
import 'package:flexchamp/app/cubit/root_cubit.dart';
import 'package:flexchamp/features/auth/auth_gate.dart';
import 'package:flexchamp/features/home/cubit/figure_cubit.dart';
import 'package:flexchamp/features/home/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<FigureCubit>()..start(),
        ),
        BlocProvider(
          create: (context) => RootCubit()..start(),
        ),
      ],
      child: BlocBuilder<RootCubit, RootState>(
        builder: (context, state) {
          return MaterialApp(
        title: 'Flexchamp',
        debugShowCheckedModeBanner: Config.debugShowCheckedModeBanner,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: state.user == null ? const AuthGate() : HomePage(currentUser: state.user!),);
        
        }
      ),
    );
  }
}
