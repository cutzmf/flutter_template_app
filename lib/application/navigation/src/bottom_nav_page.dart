import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/home.dart';
import '../../../profile/profile.dart';
import '../navigation.dart';

class BottomNavigationPage extends MaterialPage {
  BottomNavigationPage(NavigationCubit cubit, ProfileRepo profileRepo)
      : super(
          child: BlocProvider.value(
            value: cubit,
            child: Scaffold(
              body: IndexedStack(
                children: [
                  HomePage(cubit.homeTapsHandler).child,
                  ProfilePage(profileRepo).child,
                ],
              ),
              bottomNavigationBar: SizedBox(
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.fire_extinguisher),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.person_outline_rounded),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
}
