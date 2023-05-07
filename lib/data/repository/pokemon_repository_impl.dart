import 'package:injectable/injectable.dart';
import 'package:pokedex/data/service/api/app_api.dart';
import 'package:pokedex/domain/model/pokemon/pokemon.dart';
import 'package:pokedex/domain/model/pokemon_list_response/pokemon_list_response.dart';
import 'package:pokedex/domain/repository/pokemon_repository.dart';

@Injectable(as: PokemonRepository)
class PokemonRepositoryImpl implements PokemonRepository {
  PokemonRepositoryImpl(this._api);
  final ClientApi _api;

  @override
  Future<List<Pokemon>?> getPokemonList() async {
    final result = await _api.getPokemonList();
    return result.results;
  }

  @override
  Future<Pokemon> getPokemonDetails(String id) {
    // TODO: implement getPokemonDetails
    throw UnimplementedError();
  }
}
