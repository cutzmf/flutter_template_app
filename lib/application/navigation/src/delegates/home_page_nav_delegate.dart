import '../../../../home/home.dart';
import '../../../../profile/profile.dart';
import '../cubit.dart';

class HomeNavigationDelegate implements HomeDependencies {
  final NavigationCubit navigationCubit;

  HomeNavigationDelegate(this.navigationCubit);

  @override
  void onFab() => navigationCubit.push(ProfilePage(navigationCubit.dependencyResolver()));
}
