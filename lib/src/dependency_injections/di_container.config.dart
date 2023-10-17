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
import '../features/services/data/datasources/services.remote_datasource.dart'
    as _i15;
import '../features/services/data/repositories/services.repository_impl.dart'
    as _i17;
import '../features/services/domain/repositories/services.repository.dart'
    as _i16;
import '../features/services/domain/usecases/services.usecases.dart' as _i18;
import '../features/user/data/datasources/user.remote_datasource.dart' as _i19;
import '../features/user/data/repositories/user.repository_impl.dart' as _i21;
import '../features/user/domain/repositories/user.repository.dart' as _i20;
import '../features/user/domain/usecases/user.usecases.dart' as _i22;
import 'module.dart' as _i23;

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
  gh.factory<_i15.ServicesRemoteDataSource>(
      () => _i15.ServicesRemoteDataSourceImpl(gh<_i3.AppHttpClient>()));
  gh.factory<_i16.ServicesRepository>(
      () => _i17.ServicesRepositoryImpl(gh<_i15.ServicesRemoteDataSource>()));
  gh.factory<_i18.ServicesUsecase>(
      () => _i18.ServicesUsecase(gh<_i16.ServicesRepository>()));
  gh.factory<_i19.UserRemoteDatasource>(
      () => _i19.UserRemoteDatasourceImpl(gh<_i3.AppHttpClient>()));
  gh.factory<_i20.UserRepository>(
      () => _i21.UserRepositoryImpl(gh<_i19.UserRemoteDatasource>()));
  gh.factory<_i22.UserUsecase>(
      () => _i22.UserUsecase(gh<_i20.UserRepository>()));
  gh.factory<_i18.OrdersUsecase>(
      () => _i18.OrdersUsecase(gh<_i16.ServicesRepository>()));
  gh.factory<_i18.PlaceOrderUsecase>(
      () => _i18.PlaceOrderUsecase(gh<_i16.ServicesRepository>()));
  gh.factory<_i22.UpdateUserUsecase>(
      () => _i22.UpdateUserUsecase(gh<_i20.UserRepository>()));
  gh.factory<_i22.UploadUsecase>(
      () => _i22.UploadUsecase(gh<_i20.UserRepository>()));
  return getIt;
}

class _$Modules extends _i23.Modules {}
