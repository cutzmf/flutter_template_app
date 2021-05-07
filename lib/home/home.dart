import 'package:flutter/material.dart';

import 'src/content.dart';

class HomePage extends MaterialPage {
  HomePage(HomeDependencies tapsHandler) : super(child: HomeContent(dependencies: tapsHandler));
}

abstract class HomeDependencies {
  void onFab();
}
