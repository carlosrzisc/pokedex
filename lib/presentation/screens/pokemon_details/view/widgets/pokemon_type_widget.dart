import 'package:flutter/material.dart';
import 'package:pokedex/domain/model/pokemon/pokemon_type.dart';
import 'package:pokedex/presentation/utilities/extensions/text_extensions.dart';

class PokemonTypeWidget extends StatelessWidget {
  const PokemonTypeWidget(
    this.pokemonType, {
    super.key,
  });

  final PokemonType pokemonType;
  @override
  Widget build(BuildContext context) {
    final type = pokemonType.name;
    if (type == null) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          _PokemonTypeImage(name: type),
          Text(type.capitalize()),
        ],
      ),
    );
  }
}

class _PokemonTypeImage extends StatelessWidget {
  const _PokemonTypeImage({required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/pokemon_type/$name.png',
      height: 50,
      width: 50,
    );
  }
}
