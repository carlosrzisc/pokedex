import 'package:injectable/injectable.dart';
import 'package:pokedex/domain/repository/pokemon_repository.dart';
import 'package:pokedex_api/pokedex_api.dart';

@Injectable(as: PokemonRepository)
class PokemonRepositoryImpl implements PokemonRepository {
  PokemonRepositoryImpl(this._api);
  final PokedexApi _api;
  final List<Pokemon> _pokemonList = [];

  @override
  Future<List<Pokemon>?> getPokemonList({required int offset, int limit = 20}) async {
    final result = await _api.getPokemonList(offset: offset, limit: limit);
    _pokemonList.addAll(result.results ?? []);
    return _pokemonList;
  }

  @override
  Future<Pokemon> getPokemonDetails(String id) => _api.searchPokemon(criteria: id);

  @override
  Future<Pokemon> search(String pokemon) => _api.searchPokemon(criteria: pokemon);
}
