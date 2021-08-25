abstract class Async<T> {
  final T entity;

  Async(this.entity);

  factory Async.stable(T t) => Stable(t);

  factory Async.syncing(T t) => Syncing(t);

  void when(Function(T entity) stable, Function(T entity) syncing);
}

class Stable<T> extends Async<T> {
  Stable(T entity) : super(entity);

  @override
  void when(Function(T entity) stable, Function(T entity) syncing) => stable(entity);
}

class Syncing<T> extends Async<T> {
  Syncing(T entity) : super(entity);

  @override
  void when(Function(T entity) stable, Function(T entity) syncing) => syncing(entity);
}

abstract class Either<L, R> {
  L get left;

  R get right;

  M when<M>(M Function(L left) onLeft, M Function(R right) onRight);

  factory Either.left(L l) => Left(l);

  factory Either.right(R r) => Right(r);
}

class Left<T, R> implements Either<T, R> {
  Left(this.left);

  @override
  final T left;

  @override
  R get right => throw UnimplementedError();

  @override
  M when<M>(M Function(T) onLeft, M Function(R) onRight) => onLeft(left);
}

class Right<T, L> implements Either<L, T> {
  Right(this.right);

  @override
  L get left => throw UnimplementedError();

  @override
  final T right;

  @override
  M when<M>(M Function(L left) onLeft, M Function(T right) onRight) => onRight(right);
}

class Result<T, E> {
  Result(this._either);

  final Either<Data<T>, DataAndError<T, E>> _either;

  factory Result.data(T t) => Result(Either.left(Data(t)));

  factory Result.error(T t, E e) => Result(Either.right(DataAndError(t, e)));

  void when(
    void Function(T) onData,
    void Function(T, E) onError,
  ) =>
      _either.when(
        (left) => onData(left.value),
        (right) => onError(right.value, right.error),
      );
}

class Data<T> {
  Data(this.value);

  T value;
}

class DataAndError<T, E> extends Data<T> {
  DataAndError(T data, this.error) : super(data);

  final E error;
}

void foo() {
  Async<Result<int, String>> async = Async.stable(Result.data(42));
  async = Async.syncing(Result.error(42, 'error'));
  async.entity._either.when((_) => () {}, (_) => () {});
}
