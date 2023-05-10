import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/core/routing/app_router.dart';
import 'package:pokedex/domain/model/pokemon/pokemon.dart';
import 'package:pokedex/l10n/l10n.dart';
import 'package:pokedex/presentation/screens/home/bloc/home_bloc.dart';
import 'package:pokedex/presentation/screens/home/view/widgets/pokemon_input_search.dart';
import 'package:pokedex/presentation/screens/home/view/widgets/pokemon_list_gridview.dart';
import 'package:pokedex/presentation/screens/loading/loading_screen.dart';

class HomePresenter extends StatelessWidget {
  const HomePresenter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I.get<HomeBloc>()..add(const HomeEvent.load()),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          state.maybeWhen(
            loadInProgress: () => AppLoading.showLoading(context),
            pokemonFound: (pokemon) {
              context.router.pop();
              _onPokemonSelected(context, pokemon);
            },
            pokemonNotFound: () {
              context.router.pop();
              return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(context.l10n.pokemonNotFound)));
            },
            orElse: context.router.pop, // dismiss loading animation
          );
        },
        builder: (context, state) {
          return Stack(
            children: [
              state.maybeWhen(
                loadSuccess: (pokemonList, _) => PokemonListGridView(
                  pokemonList,
                  onPokemonTap: (pokemon) => _onPokemonSelected(context, pokemon),
                ),
                loadFailure: () => Text(context.l10n.genericError),
                orElse: () => const SizedBox.shrink(),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 60, 20, 0),
                child: PokemonInputSearch(
                  onSearch: (text) => context.read<HomeBloc>().add(HomeEvent.search(text)),
                ),
              ),
            ],
          );
        },
        buildWhen: (previous, current) =>
            current is! LoadInProgress && current is! PokemonFound && current is! PokemonNotFound,
      ),
    );
  }

  void _onPokemonSelected(BuildContext context, Pokemon pokemon) {
    final id = pokemon.pokemonId;
    if (id != null) {
      context.router.push(PokemonDetailsRoute(pokemonId: id));
    }
  }
}
