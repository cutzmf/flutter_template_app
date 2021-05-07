import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';

typedef DependencyResolver = T Function<T>();

class NavigationState {
  final int bottomIndex;
  final List<Page> pages;

  const NavigationState({
    required this.bottomIndex,
    required this.pages,
  });

  NavigationState copyWith({
    int? bottomIndex,
    List<Page>? pages,
  }) {
    if ((bottomIndex == null || identical(bottomIndex, this.bottomIndex)) &&
        (pages == null || identical(pages, this.pages))) {
      return this;
    }

    return NavigationState(
      bottomIndex: bottomIndex ?? this.bottomIndex,
      pages: pages ?? this.pages,
    );
  }
}

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit(this.dependencyResolver)
      : super(
          const NavigationState(bottomIndex: 0, pages: []),
        );

  final DependencyResolver dependencyResolver;

  void onBottomHome() => emit(state.copyWith(bottomIndex: 0));

  void onBottomProfile() => emit(state.copyWith(bottomIndex: 1));

  void push(Page page) => emit(state.copyWith(pages: [...state.pages, page]));

  bool onPopPage(Route<dynamic> route, dynamic result) {
    final updatesPages = state.pages.where((page) => page != route.settings).toList();
    emit(state.copyWith(pages: updatesPages));
    return route.isFirst ? false : route.didPop(result);
  }
}
