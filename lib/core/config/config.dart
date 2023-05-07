import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

import 'package:pokedex/core/injection/injector.dart';

Future<void> config(String env) async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      /// iOS - Results in light icons
      statusBarBrightness: Brightness.dark,

      /// Android - Results in light icons
      statusBarIconBrightness: Brightness.light,
    ),
  );
  await configure(env);
}
