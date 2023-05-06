import 'package:flutter/material.dart';
import 'package:pokedex/l10n/l10n.dart';

extension BuildContextExtensions on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  AppLocalizations get l10n => AppLocalizations.of(this);
  FocusScopeNode get focusScope => FocusScope.of(this);
  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenWidth => MediaQuery.of(this).size.width;
  bool get enlargedText => MediaQuery.of(this).textScaleFactor > 1.2;
  bool get thinScreen => screenWidth <= 375;
}
