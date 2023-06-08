import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/core/config/env_config.dart';
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
  PokedexApi get api => PokedexApi.withOptions(isLoggingEnabled: EnvConfig.isApiLoggerEnabled);
}
