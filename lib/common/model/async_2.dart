import 'dart:async';

abstract class AsyncStateVisitor<T, R> {
  R visitLoaded(StableState<T> async);

  R visitLoading(SyncingState<T> async);

  R visitError(ErrorState<T> async);
}

abstract class AsyncState<T> {
  final T data;

  const AsyncState(this.data);

  R accept<R>(AsyncStateVisitor<T, R> visitor);
}

class StableState<T> extends AsyncState<T> {
  const StableState(T value) : super(value);

  @override
  R accept<R>(AsyncStateVisitor<T, R> visitor) => visitor.visitLoaded(this);
}

class SyncingState<T> extends AsyncState<T> {
  SyncingState(T value) : super(value);

  @override
  R accept<R>(AsyncStateVisitor<T, R> visitor) => visitor.visitLoading(this);
}

class ErrorState<T> extends AsyncState<T> {
  final Object error;

  ErrorState(T value, this.error) : super(value);

  @override
  R accept<R>(AsyncStateVisitor<T, R> visitor) => visitor.visitError(this);
}

abstract class Async<T> {
  final _controller = StreamController<AsyncState<T>>.broadcast(sync: true);
  AsyncState<T> _current;

  Async(this._current) {
    _controller.onListen = _emitCurrent;
    _controller.stream.listen(_updateCurrent);
  }

  void _updateCurrent(AsyncState<T> value) => asyncState = value;

  void _emitCurrent() => _controller.add(_current);

  Future<void> _emitLoaded();

  // Public api
  Stream<AsyncState<T>> get stream => _controller.stream;

  set asyncState(AsyncState<T> newValue) {
    if (_current == newValue) return;
    _current = newValue;
  }

  AsyncState<T> get asyncState => _current;

  Future<void> sync() async {
    try {
      _controller.add(SyncingState(_current.data));
      await _emitLoaded();
    } on Object catch (error) {
      _controller.add(ErrorState(_current.data, error));
      rethrow;
    }
  }

  void close() => _controller.close();
}

extension AsyncExt<T> on Async<T> {
  Stream<T> get dataStream => stream.map((event) => event.data);
}

class StabilizeWith<T> implements AsyncStateVisitor<T, AsyncState<T>> {
  StabilizeWith(this.value);

  final T value;

  @override
  AsyncState<T> visitError(ErrorState<T> async) => StableState(value);

  @override
  AsyncState<T> visitLoaded(StableState<T> async) => StableState(value);

  @override
  AsyncState<T> visitLoading(SyncingState<T> async) => StableState(value);
}

class KeepState<T> implements AsyncStateVisitor<T, AsyncState<T>> {
  KeepState(this.value);

  final T value;

  @override
  AsyncState<T> visitError(ErrorState<T> async) => ErrorState(value, async.error);

  @override
  AsyncState<T> visitLoaded(StableState<T> async) => StableState(value);

  @override
  AsyncState<T> visitLoading(SyncingState<T> async) => SyncingState(value);
}

abstract class Query<T> extends Async<T> {
  Query(AsyncState<T> value, this.futureFactory) : super(value);

  final Future<T> Function() futureFactory;

  @override
  Future<void> _emitLoaded() async {
    asyncState = asyncState.accept(StabilizeWith(await futureFactory()));
  }
}

abstract class Command<T> extends Async<T> {
  Command(AsyncState<T> value, this.futureFactory) : super(value);

  final Future<void> Function() futureFactory;

  @override
  Future<void> _emitLoaded() async {
    await futureFactory();
    asyncState = asyncState.accept(StabilizeWith(asyncState.data));
  }
}