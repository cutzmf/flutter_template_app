import 'package:flutter/widgets.dart';

import '../../home/home.dart';

class RouteInfo {}

class NavigationImpl extends RouterDelegate<RouteInfo>
    with PopNavigatorRouterDelegateMixin<RouteInfo>
    implements RouteInformationParser<RouteInfo> {
  static final _key = GlobalKey<NavigatorState>();

  @override
  GlobalKey<NavigatorState>? get navigatorKey => _key;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        HomePage(),
      ],
      onPopPage: (route, result) {
        if (!route.isFirst) {
          route.didPop(result);
          return false;
        }
        return route.isFirst ? false : route.didPop(result);
      },
    );
  }

  @override
  void addListener(VoidCallback listener) {
    // TODO: implement addListener
  }

  @override
  Future<RouteInfo> parseRouteInformation(
    RouteInformation routeInformation,
  ) async {
    return RouteInfo();
  }

  @override
  void removeListener(VoidCallback listener) {
    // TODO: implement removeListener
  }

  @override
  RouteInformation? restoreRouteInformation(RouteInfo configuration) {
    // TODO: implement restoreRouteInformation
    throw UnimplementedError();
  }

  @override
  Future<void> setNewRoutePath(RouteInfo configuration) {
    // TODO: implement setNewRoutePath
    throw UnimplementedError();
  }
}
