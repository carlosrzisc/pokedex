import 'package:injectable/injectable.dart';
import 'package:pokedex/data/service/api/app_api.dart';
import 'package:pokedex/domain/model/pokemon/pokemon.dart';
import 'package:pokedex/domain/repository/pokemon_repository.dart';

@Injectable(as: PokemonRepository)
class PokemonRepositoryImpl implements PokemonRepository {
  PokemonRepositoryImpl(this._api);
  final ClientApi _api;
  final List<Pokemon> _pokemonList = [];

  @override
  Future<List<Pokemon>?> getPokemonList({required int offset, int limit = 20}) async {
    final result = await _api.getPokemonList(offset: offset, limit: limit);
    _pokemonList.addAll(result.results ?? []);
    return _pokemonList;
  }

  @override
  Future<Pokemon> getPokemonDetails(String id) {
    // TODO: implement getPokemonDetails
    throw UnimplementedError();
  }

  @override
  Future<Pokemon> search(String pokemon) => _api.searchPokemon(criteria: pokemon);
}
