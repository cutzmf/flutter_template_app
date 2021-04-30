import 'package:flutter/widgets.dart';

import 'route_info.dart';

class NavRouteInformationParser implements RouteInformationParser<RouteInfo> {
  @override
  Future<RouteInfo> parseRouteInformation(
    RouteInformation routeInformation,
  ) async {
    return RouteInfo();
  }

  @override
  RouteInformation? restoreRouteInformation(RouteInfo configuration) {
    // TODO: implement restoreRouteInformation
    throw UnimplementedError();
  }
}
