import 'package:dio/dio.dart';
import 'package:pokedex_api/src/model/api_endpoints.dart';
import 'package:pokedex_api/src/model/model.dart';
import 'package:retrofit/http.dart';

part 'pokedex_api.g.dart';

@RestApi()
abstract class PokedexApi {
  factory PokedexApi(Dio dio, {String? baseUrl}) = _PokedexApi;

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
