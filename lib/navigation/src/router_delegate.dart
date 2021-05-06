import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../navigation.dart';
import 'route_info.dart';

final _key = GlobalKey<NavigatorState>();

class NavRouterDelegate extends RouterDelegate<RouteInfo> with PopNavigatorRouterDelegateMixin<RouteInfo> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, List<Page>>(
      builder: (context, pages) {
        final cubit = context.read<NavigationCubit>();
        return Navigator(
          key: navigatorKey,
          pages: [
            cubit.initialPage,
            ...pages,
          ],
          onPopPage: cubit.onPopPage,
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
