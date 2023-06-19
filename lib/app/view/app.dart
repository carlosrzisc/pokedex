import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/app/presentation/app_bloc_providers.dart';
import 'package:pokedex/app/presentation/bloc/locale/locale_bloc.dart';
import 'package:pokedex/app/routing/app_router.dart';
import 'package:pokedex/l10n/l10n.dart';
import 'package:pokemon_ui/pokemon_ui.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GetIt.I.get<AppRouter>();

    return MultiBlocProvider(
      providers: appBlocProviders,
      child: BlocBuilder<LocaleBloc, LocaleState>(
        builder: (context, state) {
          return MaterialApp.router(
            theme: AppThemes.darkTheme,
            debugShowCheckedModeBanner: false,
            locale: state.locale,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            routerDelegate: router.delegate(),
            routeInformationParser: router.defaultRouteParser(),
          );
        },
      ),
    );
  }
}
