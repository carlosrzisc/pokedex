import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/presentation/screens/pokemon_details/presenter/pokemon_details_presenter.dart';
import 'package:pokedex_api/pokedex_api.dart';

@RoutePage()
class PokemonDetailsScreen extends StatelessWidget {
  const PokemonDetailsScreen(this.pokemon, {super.key});
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () => context.router.pop(),
                  icon: const Icon(Icons.arrow_back),
                ),
              ],
            ),
            Expanded(child: PokemonDetailsPresenter(pokemon)),
          ],
        ),
      ),
    );
  }
}
