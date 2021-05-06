import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';

import '../../home/home.dart';
import '../../profile/profile.dart';

typedef DependencyResolver = T Function<T>();

class NavigationCubit extends Cubit<List<Page>> {
  NavigationCubit(this.dependencyResolver) : super([]);

  final DependencyResolver dependencyResolver;

  late final homeTapsHandler = HomeDependenciesDelegate(this);

  late final initialPage = HomePage(homeTapsHandler);

  void push(Page page) => emit(List.of(state..add(page)));

  bool onPopPage(Route<dynamic> route, dynamic result) {
    emit(List.of(state..remove(route.settings)));
    return route.isFirst ? false : route.didPop(result);
  }
}

class HomeDependenciesDelegate implements HomeDependecies {
  final NavigationCubit navigationCubit;

  HomeDependenciesDelegate(this.navigationCubit);

  @override
  void onFab() => navigationCubit.push(ProfilePage(navigationCubit.dependencyResolver()));
}
