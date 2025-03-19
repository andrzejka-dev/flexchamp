import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flexchamp/data/affirmation_remote_data_source.dart';
import 'package:flexchamp/domain/repositories/affirmation_repository.dart';
import 'package:flexchamp/domain/repositories/details_repository.dart';
import 'package:flexchamp/domain/repositories/figure_repository.dart';
import 'package:flexchamp/features/affirmation/cubit/affirmation_cubit.dart';
import 'package:flexchamp/features/details/cubit/details_cubit.dart';
import 'package:flexchamp/features/home/cubit/figure_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  // Firebase services
  getIt.registerLazySingleton(() => FirebaseFirestore.instance);
  getIt.registerLazySingleton(() => FirebaseAuth.instance);
  
  // DataSource
  getIt.registerLazySingleton(() => AffirmationRemoteRetrofitDataSource(Dio()));
 
  // Repository
  getIt.registerLazySingleton(
  () => AffirmationRepository(getIt<AffirmationRemoteRetrofitDataSource>())
);

  getIt.registerLazySingleton(
    () => FiguresRepository(
      firestore: getIt<FirebaseFirestore>(),
      auth: getIt<FirebaseAuth>()
    )
  );
  
  getIt.registerLazySingleton(
    () => DetailsRepository(
      firestore: getIt<FirebaseFirestore>(),
    )
  );

  // Bloc/Cubit
  getIt.registerFactory(
    () => AffirmationCubit(getIt<AffirmationRepository>())
  );
  getIt.registerFactory(
    () => FigureCubit(getIt<FiguresRepository>())
  );
  getIt.registerFactory(
    () => DetailsCubit(getIt<DetailsRepository>())
  );

}


