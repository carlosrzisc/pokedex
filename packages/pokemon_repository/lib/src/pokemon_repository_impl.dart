import 'dart:async';
import 'package:pokedex_api/pokedex_api.dart';
import 'package:pokemon_repository/src/domain/pokemon_repository.dart';
import 'package:rxdart/rxdart.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  PokemonRepositoryImpl({PokedexApi? pokedexApi}) : _pokedexApi = pokedexApi ?? PokedexApi.withOptions();
  final PokedexApi _pokedexApi;
  final _pokemonStreamController = BehaviorSubject<List<Pokemon>>();
  int offset = 0;
  static const int _limit = 30;
  bool hasReachedMax = false;

  @override
  Stream<List<Pokemon>> get pokemonList => _pokemonStreamController.asBroadcastStream();

  @override
  Future<void> loadMore() async {
    if (hasReachedMax) return;

    try {
      final result = (await _pokedexApi.getPokemonList(offset: offset, limit: _limit)).results;
      if (result == null) {
        _pokemonStreamController.addError(Exception('Error fetching pokemon list'));
        return;
      }

      offset += _limit;
      final currentList = _pokemonStreamController.hasValue ? _pokemonStreamController.value : <Pokemon>[];
      hasReachedMax = result.length < _limit;

      _pokemonStreamController.add([...currentList, ...result]);
    } catch (e) {
      _pokemonStreamController.addError(e);
    }
  }

  @override
  Future<Pokemon> getPokemonDetails(String id) => _pokedexApi.searchPokemon(criteria: id);

  @override
  Future<Pokemon> search(String pokemon) => _pokedexApi.searchPokemon(criteria: pokemon);
}
