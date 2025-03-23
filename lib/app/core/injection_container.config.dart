// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:dio/dio.dart' as _i361;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:flexchamp/app/core/firebase_module.dart' as _i921;
import 'package:flexchamp/app/cubit/root_cubit.dart' as _i396;
import 'package:flexchamp/data/affirmation_remote_data_source.dart' as _i380;
import 'package:flexchamp/data/dio_module.dart' as _i373;
import 'package:flexchamp/domain/repositories/affirmation_repository.dart'
    as _i819;
import 'package:flexchamp/domain/repositories/details_repository.dart' as _i644;
import 'package:flexchamp/domain/repositories/figure_repository.dart' as _i258;
import 'package:flexchamp/features/affirmation/cubit/affirmation_cubit.dart'
    as _i519;
import 'package:flexchamp/features/details/cubit/details_cubit.dart' as _i735;
import 'package:flexchamp/features/home/cubit/figure_cubit.dart' as _i148;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final firebaseModule = _$FirebaseModule();
    final appInfrastructureModule = _$AppInfrastructureModule();
    gh.factory<_i396.RootCubit>(() => _i396.RootCubit());
    gh.factory<_i974.FirebaseFirestore>(() => firebaseModule.firestore);
    gh.factory<_i59.FirebaseAuth>(() => firebaseModule.auth);
    gh.singleton<_i361.Dio>(() => appInfrastructureModule.dio);
    gh.factory<_i644.DetailsRepository>(() =>
        _i644.DetailsRepository(firestore: gh<_i974.FirebaseFirestore>()));
    gh.factory<_i380.AffirmationRemoteRetrofitDataSource>(
        () => _i380.AffirmationRemoteRetrofitDataSource(gh<_i361.Dio>()));
    gh.factory<_i735.DetailsCubit>(
        () => _i735.DetailsCubit(gh<_i644.DetailsRepository>()));
    gh.factory<_i258.FiguresRepository>(() => _i258.FiguresRepository(
          firestore: gh<_i974.FirebaseFirestore>(),
          auth: gh<_i59.FirebaseAuth>(),
        ));
    gh.factory<_i148.FigureCubit>(
        () => _i148.FigureCubit(gh<_i258.FiguresRepository>()));
    gh.factory<_i819.AffirmationRepository>(() => _i819.AffirmationRepository(
        gh<_i380.AffirmationRemoteRetrofitDataSource>()));
    gh.factory<_i519.AffirmationCubit>(
        () => _i519.AffirmationCubit(gh<_i819.AffirmationRepository>()));
    return this;
  }
}

class _$FirebaseModule extends _i921.FirebaseModule {}

class _$AppInfrastructureModule extends _i373.AppInfrastructureModule {}
