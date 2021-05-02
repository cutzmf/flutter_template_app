import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';

import '../../home/home.dart';
import '../../profile/profile.dart';

class NavigationBloc extends Cubit<List<Page>> implements HomeTapsHandler {
  NavigationBloc() : super([]);

  @override
  void onFab() {
    emit(List.of(state..add(ProfilePage())));
  }

  bool onPopPage(Route<dynamic> route, dynamic result) {
    emit(List.of(state..remove(route.settings)));
    return route.isFirst ? false : route.didPop(result);
  }
}
