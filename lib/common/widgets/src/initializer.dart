import 'package:flutter/widgets.dart';

class Initializer<T> extends StatefulWidget {
  const Initializer({
    required this.initializer,
    required this.child,
    this.progressBuilder,
    Key? key,
  }) : super(key: key);

  final Stream<T> Function(BuildContext) initializer;
  final Widget child;
  final Widget Function(BuildContext, T?)? progressBuilder;

  @override
  _InitializerState<T> createState() => _InitializerState<T>();
}

class _InitializerState<T> extends State<Initializer<T>> {
  late Stream<T> _stream;

  @override
  void initState() {
    _stream = widget.initializer(context);
    super.initState();
  }

  @override
  void didUpdateWidget(Initializer<T> oldWidget) {
    if (widget.initializer != oldWidget.initializer) {
      _stream = widget.initializer(context);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
      stream: _stream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return widget.child;
        }

        return widget.progressBuilder?.call(context, snapshot.data) ??
            const SizedBox.shrink();
      },
    );
  }
}
