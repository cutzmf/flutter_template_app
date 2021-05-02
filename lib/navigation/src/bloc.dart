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

  void onPopPage(Route route) {
    emit(List.of(state..remove(route.settings)));
  }
}
