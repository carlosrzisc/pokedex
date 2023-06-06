import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/core/config/env_config.dart';
import 'package:pokedex/core/config/flavors/flavor_config.dart';
import 'package:pokedex/core/routing/app_router.dart';
import 'package:pokedex_api/pokedex_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @lazySingleton
  AppRouter get appRouter => AppRouter();

  @lazySingleton
  Dio get dio => Dio(BaseOptions(headers: {'Accept': 'application/json'}));

  @LazySingleton()
  PokedexApi get api {
    final dio = GetIt.I.get<Dio>();
    if (EnvConfig.isApiLoggerEnabled) {
      dio.interceptors.add(NetworkLoggerInterceptor());
    }
    dio.interceptors.add(DioCacheInterceptor(options: cacheOptions));

    return PokedexApi(
      dio,
      baseUrl: GetIt.I.get<FlavorConfig>().baseUrl,
    );
  }
}
