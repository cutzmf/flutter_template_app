import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'application/dependencies.dart';
import 'application/l10n/l10n.dart';
import 'application/splash.dart';
import 'common/common.dart';

void main() {
  runApp(
    OverallDependencies(
      child: Initializer<int>(
        initializer: _init,
        initialProgress: 0,
        progressBuilder: (context, progress) => Splash(progress: progress),
        child: Builder(
          builder: (context) {
            return MaterialApp.router(
              onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
              routerDelegate: context.read(),
              routeInformationParser: context.read(),
              supportedLocales: AppLocalizations.supportedLocales,
              localizationsDelegates: [
                ...AppLocalizations.localizationsDelegates,
                HomeL10nDelegate(),
              ],
            );
          },
        ),
      ),
    ),
  );
}

Stream<int> _init(BuildContext context) async* {
  for (int i = 1; i <= 2; i++) {
    await Future.delayed(const Duration(milliseconds: 200));
    yield i;
  }
}
