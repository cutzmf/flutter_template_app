import 'package:flutter/material.dart';

import 'src/content.dart';

class HomePage extends MaterialPage {
  HomePage(HomeDependecies tapsHandler)
      : super(child: HomeContent(dependencies: tapsHandler));
}

abstract class HomeDependecies {
  void onFab();
}
