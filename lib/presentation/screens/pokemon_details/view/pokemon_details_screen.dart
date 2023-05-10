import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class PokemonDetailsScreen extends StatelessWidget {
  const PokemonDetailsScreen(this.pokemonId, {super.key});
  final String pokemonId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.router.pop(),
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(pokemonId),
      ),
      body: Text(pokemonId),
    );
  }
}
