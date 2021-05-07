import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/home.dart';
import '../../../profile/profile.dart';
import '../navigation.dart';
import 'delegates/home_page_nav_delegate.dart';

class BottomNavigationPage extends MaterialPage {
  BottomNavigationPage(NavigationCubit cubit, ProfileRepo profileRepo)
      : super(
          child: BlocProvider.value(
            value: cubit,
            child: Scaffold(
              body: BlocBuilder<NavigationCubit, NavigationState>(
                bloc: cubit,
                builder: (context, state) {
                  return IndexedStack(
                    index: state.bottomIndex,
                    children: [
                      HomePage(HomeNavigationDelegate(cubit)).child,
                      ProfilePage(profileRepo).child,
                    ],
                  );
                },
              ),
              bottomNavigationBar: SizedBox(
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.fire_extinguisher),
                      onPressed: cubit.onBottomHome,
                    ),
                    IconButton(
                      icon: const Icon(Icons.person_outline_rounded),
                      onPressed: cubit.onBottomProfile,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
}
