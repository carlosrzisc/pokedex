import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pokedex/presentation/utilities/extensions/extensions.dart';
import 'package:pokedex/presentation/utilities/widget_keys.dart';

class AppLoading {
  AppLoading._();

  static Future<void> showLoading(BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      barrierColor: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.6),
      builder: (context) {
        return const _LoadingScreen(key: AppKeys.loadingScreen);
      },
    );
  }
}

class _LoadingScreen extends StatefulWidget {
  const _LoadingScreen({super.key});

  @override
  State<_LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<_LoadingScreen> {
  bool isSlow = false;
  late Timer timer;

  @override
  void initState() {
    timer = Timer(const Duration(seconds: 3), () => setState(() => isSlow = true));
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        OverflowBox(
          child: SizedBox(
            height: 100,
            width: 100,
            child: Lottie.asset(
              'assets/lottie/loading.json',
            ),
          ),
        ),
        if (isSlow)
          Align(
            child: Text(
              context.l10n.takingLong,
              style: context.textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
          ),
      ],
    );
  }
}
