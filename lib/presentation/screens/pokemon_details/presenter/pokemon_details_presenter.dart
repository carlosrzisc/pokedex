import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/core/theme/theme.dart';
import 'package:pokedex/presentation/screens/loading/loading_screen.dart';
import 'package:pokedex/presentation/screens/pokemon_details/bloc/details_bloc.dart';
import 'package:pokedex/presentation/screens/pokemon_details/view/widgets/pokemon_details_view.dart';
import 'package:pokedex/presentation/utilities/extensions/extensions.dart';
import 'package:pokedex_api/pokedex_api.dart';

class PokemonDetailsPresenter extends StatelessWidget {
  const PokemonDetailsPresenter(this.pokemon, {super.key});
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I.get<DetailsBloc>()..add(DetailsEvent.fetch(pokemon)),
      child: BlocConsumer<DetailsBloc, DetailsState>(
        listener: (context, state) {
          state.maybeWhen(
            loadFailure: () {
              ScaffoldMessenger.of(context).showSnackBar(
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
            orElse: () {},
          );
        },
        buildWhen: (previous, current) => current is DetailsSuccess || current is DetailsInitial,
        builder: (context, state) {
          return state.maybeWhen(
            initial: () => PokemonDetailsView(pokemon),
            loadInProgress: LoadingScreen.new,
            loadSuccess: PokemonDetailsView.new,
            orElse: SizedBox.shrink,
          );
        },
      ),
    );
  }
}
