import 'package:flutter/material.dart';

import 'src/content.dart';

class HomePage extends MaterialPage {
  HomePage(HomeTapsHandler tapsHandler)
      : super(child: HomeContent(tapsHandler: tapsHandler));
}

abstract class HomeTapsHandler {
  void onFab();
}
