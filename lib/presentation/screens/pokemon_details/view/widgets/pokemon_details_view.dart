import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/domain/model/pokemon/pokemon.dart';

class PokemonDetailsView extends StatelessWidget {
  const PokemonDetailsView(this.pokemon, {super.key});
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    final image = pokemon.image;

    return image != null
        ? Hero(
            tag: 'image-${pokemon.pokemonId}',
            child: Image(image: CachedNetworkImageProvider(image)),
          )
        : const SizedBox.shrink();
  }
}
