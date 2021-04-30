import 'package:flutter/widgets.dart';

import '../../home/home.dart';
import 'route_info.dart';

final _key = GlobalKey<NavigatorState>();

class NavRouterDelegate extends RouterDelegate<RouteInfo>
    with PopNavigatorRouterDelegateMixin<RouteInfo> {
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
  // TODO: implement navigatorKey
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
