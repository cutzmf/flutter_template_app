import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  Splash({
    required this.progress,
    Key? key,
  }) : super(key: key);

  final int progress;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Text('$runtimeType $progress'),
        ),
      ),
    );
  }
}
