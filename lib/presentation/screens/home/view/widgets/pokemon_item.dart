// pokemonitem stateless widget
import 'package:flutter/material.dart';
import 'package:pokedex/domain/model/pokemon/pokemon.dart';

class PokemonItem extends StatelessWidget {
  const PokemonItem(
    this._pokemon, {
    this.onTap,
    super.key,
  });
  final Pokemon _pokemon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final image = _pokemon.image;
    return ListTile(
      title: image != null ? Image.network(image) : const SizedBox.shrink(),
      subtitle: Text(_pokemon.name ?? ''),
      onTap: onTap,
    );
  }
}
