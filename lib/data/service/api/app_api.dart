import 'package:dio/dio.dart';
import 'package:pokedex/data/service/api/api_endpoints.dart';
import 'package:pokedex/domain/model/pokemon_list_response/pokemon_list_response.dart';
import 'package:retrofit/http.dart';

part 'app_api.g.dart';

@RestApi()
abstract class ClientApi {
  factory ClientApi(Dio dio, {String? baseUrl}) = _ClientApi;

  /// ************************************
  /// AUTH ENDPOINTS
  /// ************************************

  @GET(ApiEndpoints.pokemon)
  Future<PokemonListResponse> getPokemonList({
    @Query('offset') required int offset,
    @Query('limit') required int limit,
  });

  @GET('${ApiEndpoints.pokemon}/{criteria}')
  Future<PokemonListResponse> searchPokemon({
    @Path('criteria') required String criteria,
  });
}
