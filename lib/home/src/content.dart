import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../home.dart';
import 'strings.dart';

class HomeContent extends StatelessWidget {
  final HomeDependencies dependencies;

  HomeContent({required this.dependencies, Key? key}) : super(key: key);

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
      floatingActionButton: FloatingActionButton(onPressed: dependencies.onFab),
    );
  }
}
