import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'application/dependencies.dart';
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
              routerDelegate: context.read(),
              routeInformationParser: context.read(),
            );
          },
        ),
      ),
    ),
  );
}

Stream<int> _init(BuildContext context) async* {
  for (int i = 1; i <= 2; i++) {
    await Future.delayed(const Duration(seconds: 1));
    yield i;
  }
}
