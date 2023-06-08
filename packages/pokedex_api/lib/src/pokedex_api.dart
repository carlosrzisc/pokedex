import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:pokedex_api/src/cache/cache_options.dart';
import 'package:pokedex_api/src/logger/logger_interceptor.dart';
import 'package:pokedex_api/src/model/api_endpoints.dart';
import 'package:pokedex_api/src/model/model.dart';
import 'package:retrofit/http.dart';

part 'pokedex_api.g.dart';

@RestApi(baseUrl: 'https://pokeapi.co/api/v2/')
abstract class PokedexApi {
  factory PokedexApi._(Dio dio, {String? baseUrl}) = _PokedexApi;

  factory PokedexApi.withDio(Dio dio, {String? baseUrl}) => PokedexApi._(
        dio,
        baseUrl: baseUrl,
      );

  factory PokedexApi.withOptions({bool isLoggingEnabled = false, String? baseUrl}) => PokedexApi._(
        Dio(BaseOptions(headers: {'Accept': 'application/json'}))
          ..interceptors.add(
            isLoggingEnabled ? NetworkLoggerInterceptor() : InterceptorsWrapper(),
          )
          ..interceptors.add(
            DioCacheInterceptor(options: cacheOptions),
          ),
        baseUrl: baseUrl,
      );

  @GET(ApiEndpoints.pokemon)
  Future<PokemonListResponse> getPokemonList({
    @Query('offset') required int offset,
    @Query('limit') required int limit,
  });

  @GET('${ApiEndpoints.pokemon}/{criteria}')
  Future<Pokemon> searchPokemon({
    @Path('criteria') required String criteria,
  });
}
