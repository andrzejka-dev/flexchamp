import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injection_container.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async => getIt.init();


// void configureDependencies() {
//   // Firebase services
//   getIt.registerLazySingleton(() => FirebaseFirestore.instance);
//   getIt.registerLazySingleton(() => FirebaseAuth.instance);
  
//   // DataSource
//   getIt.registerLazySingleton(() => AffirmationRemoteRetrofitDataSource(Dio()));
 
//   // Repository
//   getIt.registerLazySingleton(
//   () => AffirmationRepository(getIt<AffirmationRemoteRetrofitDataSource>())
// );

  // getIt.registerLazySingleton(
  //   () => FiguresRepository(
  //     firestore: getIt<FirebaseFirestore>(),
  //     auth: getIt<FirebaseAuth>()
  //   )
  // );

  // getIt.registerLazySingleton(
  //   () => DetailsRepository(
  //     firestore: getIt<FirebaseFirestore>(),
  //   )
  // );

//   // Bloc/Cubit
//   getIt.registerFactory(
//     () => AffirmationCubit(getIt<AffirmationRepository>())
//   );
//   getIt.registerFactory(
//     () => FigureCubit(getIt<FiguresRepository>())
//   );
//   getIt.registerFactory(
//     () => DetailsCubit(getIt<DetailsRepository>())
//   );

// }


