import 'dart:math';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex_api/pokedex_api.dart';
import 'package:test/test.dart';
import 'pokedex_api_test.mocks.dart';

@GenerateNiceMocks([MockSpec<PokedexApi>()])
void main() {
  group('#fetchPokemon', () {
    late PokedexApi service;

    setUp(() {
      service = MockPokedexApi();
    });

    test('Fetch pokemon list successfull call', () async {
      final mockedResponse = _mockPokemonList;
      when(service.getPokemonList(offset: 0, limit: 5)).thenAnswer((realInvocation) async => mockedResponse);

      expect(await service.getPokemonList(offset: 0, limit: 5), mockedResponse);
    });

    test('Fetch pokemon details successfull call', () async {
      final pokemon = _incineroar;
      when(service.searchPokemon(criteria: 'incineroar')).thenAnswer((realInvocation) async => pokemon);

      expect(await service.searchPokemon(criteria: 'incineroar'), pokemon);
    });
  });
}

Pokemon get _incineroar {
  return Pokemon(
    id: 727,
    name: 'incineroar',
    url: 'https://pokeapi.co/api/v2/pokemon/727',
    weight: 830,
    height: 18,
    types: [
      PokemonTypeItem(
        type: PokemonType(
          name: 'dark',
          url: 'https://pokeapi.co/api/v2/type/17/',
        ),
      ),
      PokemonTypeItem(
        type: PokemonType(
          name: 'fire',
          url: 'https://pokeapi.co/api/v2/type/10/',
        ),
      ),
    ],
  );
}

PokemonListResponse get _mockPokemonList {
  final randomListOfPokemon = List.generate(5, (_) => generateRandomPokemon());

  return PokemonListResponse(
    count: 5,
    results: randomListOfPokemon,
  );
}

final random = Random();
Pokemon generateRandomPokemon() {
  final id = random.nextInt(100);
  return Pokemon(
    name: 'Pokemon #$id',
    url: 'https://pokeapi.co/api/v2/pokemon/$id',
  );
}
