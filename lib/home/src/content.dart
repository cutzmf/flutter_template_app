import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'strings.dart';

class HomeContent extends StatelessWidget {
  HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$runtimeType'),
      ),
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(S.hiThere),
          ],
        ),
      ),
    );
  }
}
