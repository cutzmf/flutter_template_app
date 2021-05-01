import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home/home.dart';
import '../navigation.dart';
import 'route_info.dart';

final _key = GlobalKey<NavigatorState>();

class NavRouterDelegate extends RouterDelegate<RouteInfo>
    with PopNavigatorRouterDelegateMixin<RouteInfo> {
  final bloc = NavigationBloc();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, List<Page>>(
      bloc: bloc,
      builder: (context, pages) {
        print('NOW $pages');
        return Navigator(
          key: navigatorKey,
          pages: [
            HomePage(bloc),
            ...pages,
          ],
          onPopPage: (route, result) {
            bloc.onPopPage(route);
            return route.isFirst ? false : route.didPop(result);
          },
        );
      },
    );
  }

  @override
  void addListener(VoidCallback listener) {
    // TODO: implement addListener
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => _key;

  @override
  void removeListener(VoidCallback listener) {
    // TODO: implement removeListener
  }

  @override
  Future<void> setNewRoutePath(RouteInfo configuration) async {
    // TODO: implement setNewRoutePath
  }
}
