import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/l10n/l10n.dart';
import 'package:pokedex/presentation/screens/home/bloc/home_bloc.dart';
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
            orElse: context.router.pop, // dismiss loading animation
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            loadSuccess: (pokemonList, _) => PokemonListGridView(pokemonList),
            loadFailure: () => Text(context.l10n.genericError),
            orElse: () => const SizedBox.shrink(),
          );
        },
        buildWhen: (previous, current) => current is! LoadInProgress,
      ),
    );
  }
}
