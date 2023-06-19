import 'package:pokedex_api/pokedex_api.dart';
import 'package:pokemon_repository/src/domain/pokemon_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  PokemonRepositoryImpl({PokedexApi? pokedexApi}) : _pokedexApi = pokedexApi ?? PokedexApi.withOptions();
  final PokedexApi _pokedexApi;
  final List<Pokemon> _pokemonList = [];

  @override
  Future<List<Pokemon>?> getPokemonList({required int offset, int limit = 20}) async {
    final result = await _pokedexApi.getPokemonList(offset: offset, limit: limit);
    _pokemonList.addAll(result.results ?? []);
    return _pokemonList;
  }

  @override
  Future<Pokemon> getPokemonDetails(String id) => _pokedexApi.searchPokemon(criteria: id);

  @override
  Future<Pokemon> search(String pokemon) => _pokedexApi.searchPokemon(criteria: pokemon);
}
