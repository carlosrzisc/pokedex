import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/app/routing/app_router.dart';
import 'package:pokedex/l10n/l10n.dart';
import 'package:pokedex/presentation/screens/home/bloc/home_bloc.dart';
import 'package:pokedex/presentation/screens/home/view/widgets/pokemon_input_search.dart';
import 'package:pokedex/presentation/screens/home/view/widgets/pokemon_list_gridview.dart';
import 'package:pokedex/presentation/screens/loading/loading_screen.dart';
import 'package:pokedex_api/pokedex_api.dart';
import 'package:pokemon_ui/pokemon_ui.dart';

class HomePresenter extends StatelessWidget {
  const HomePresenter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I.get<HomeBloc>()
        ..add(const HomeEvent.subscriptionRequested())
        ..add(const HomeEvent.load()),
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
              return ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    context.l10n.pokemonNotFound,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  backgroundColor: AppColors.error,
                ),
              );
            },
            orElse: context.router.pop, // dismiss loading animation
          );
        },
        builder: (context, state) {
          return Stack(
            children: [
              state.maybeWhen(
                loadSuccess: (pokemonList) => PokemonListGridView(
                  pokemonList,
                  onPokemonTap: (pokemon) => _onPokemonSelected(context, pokemon),
                ),
                loadFailure: () => Text(context.l10n.genericError),
                orElse: () => const SizedBox.shrink(),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 60, 15, 0),
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
    context.router.push(PokemonDetailsRoute(pokemon: pokemon));
  }
}
