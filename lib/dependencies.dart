import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'navigation/navigation.dart';

class _Bind<T extends R, R> extends Provider<R> {
  _Bind({Key? key}) : super(create: (c) => c.read<T>(), key: key);
}

class OverallDependencies extends StatelessWidget {
  const OverallDependencies({required this.child, Key? key}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<RouteInformationParser<Object>>(
          create: (_) => NavRouteInformationParser(),
        ),
        ListenableProvider<RouterDelegate<Object>>(
          create: (_) => NavRouterDelegate(),
        ),
      ],
      child: child,
    );
  }
}
