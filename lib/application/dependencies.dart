import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../profile/profile.dart';
import 'data/data.dart';
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
        Provider(create: (_) => NavRouteInformationParser()),
        _Bind<NavRouteInformationParser, RouteInformationParser<Object>>(),
        ListenableProvider<RouterDelegate<Object>>(create: (_) => NavRouterDelegate()),
        Provider(create: (_) => ProfileRepoHttp()),
        _Bind<ProfileRepoHttp, ProfileRepo>(),
        BlocProvider(create: (context) => NavigationCubit(context.read)),
      ],
      child: child,
    );
  }
}
