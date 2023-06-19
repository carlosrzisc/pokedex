import 'package:app_storage/app_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/app/config/flavors/flavor_config.dart';
import 'package:pokedex/app/routing/app_router.dart';
import 'package:pokedex_api/pokedex_api.dart';
import 'package:pokemon_repository/pokemon_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @lazySingleton
  AppStorage get appStorage => AppStorageImpl(GetIt.I.get<SharedPreferences>());

  @lazySingleton
  StorageService get storageService => StorageServiceImpl(GetIt.I.get<AppStorage>());

  @lazySingleton
  AppRouter get appRouter => AppRouter();

  @lazySingleton
  PokedexApi get api => PokedexApi.withOptions(isLoggingEnabled: GetIt.I.get<FlavorConfig>().enableLogging);

  @lazySingleton
  PokemonRepository get pokemonRepository => PokemonRepositoryImpl(pokedexApi: api);
}
