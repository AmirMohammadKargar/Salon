// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i8;

import '../core/cache/cache_db.dart' as _i7;
import '../core/network/http_client.dart' as _i3;
import '../core/network/network_info.dart' as _i10;
import '../features/auth/data/datasources/auth.remote_datasource.dart' as _i4;
import '../features/auth/data/repositories/auth.repository_impl.dart' as _i6;
import '../features/auth/domain/repositories/auth.repository.dart' as _i5;
import '../features/auth/domain/usecases/auth.usecases.dart' as _i9;
import '../features/salon/data/datasources/salon.remote_datasource.dart'
    as _i11;
import '../features/salon/data/repositories/salon.repository_impl.dart' as _i13;
import '../features/salon/domain/repositories/salon.repository.dart' as _i12;
import '../features/salon/domain/usecases/salons.usecases.dart' as _i14;
import '../features/user/data/datasources/user.remote_datasource.dart' as _i15;
import '../features/user/data/repositories/user.repository_impl.dart' as _i17;
import '../features/user/domain/repositories/user.repository.dart' as _i16;
import '../features/user/domain/usecases/user.usecases.dart' as _i18;
import 'module.dart' as _i19;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final modules = _$Modules();
  gh.lazySingleton<_i3.AppHttpClient>(() => _i3.AppHttpClient());
  gh.factory<_i4.AuthRemoteDatasource>(
      () => _i4.AuthRemoteDatasourceImpl(gh<_i3.AppHttpClient>()));
  gh.factory<_i5.AuthRepository>(
      () => _i6.AuthRepositoryImpl(gh<_i4.AuthRemoteDatasource>()));
  gh.singleton<_i7.CacheDb>(_i7.CacheDb());
  gh.singleton<_i8.Logger>(modules.logger);
  gh.factory<_i9.LoginUsecase>(
      () => _i9.LoginUsecase(gh<_i5.AuthRepository>()));
  gh.singleton<_i10.NetworkInfo>(_i10.NetworkInfoImpl());
  gh.factory<_i9.RegisterUsecase>(
      () => _i9.RegisterUsecase(gh<_i5.AuthRepository>()));
  gh.factory<_i11.SalonRemoteDatasource>(
      () => _i11.SalonRemoteDatasourceImpl(gh<_i3.AppHttpClient>()));
  gh.factory<_i12.SalonRepository>(
      () => _i13.SalonRepositoryImpl(gh<_i11.SalonRemoteDatasource>()));
  gh.factory<_i14.SalonUsecase>(
      () => _i14.SalonUsecase(gh<_i12.SalonRepository>()));
  gh.factory<_i14.SalonsUsecase>(
      () => _i14.SalonsUsecase(gh<_i12.SalonRepository>()));
  gh.factory<_i15.UserRemoteDatasource>(
      () => _i15.UserRemoteDatasourceImpl(gh<_i3.AppHttpClient>()));
  gh.factory<_i16.UserRepository>(
      () => _i17.UserRepositoryImpl(gh<_i15.UserRemoteDatasource>()));
  gh.factory<_i18.UserUsecase>(
      () => _i18.UserUsecase(gh<_i16.UserRepository>()));
  return getIt;
}

class _$Modules extends _i19.Modules {}
