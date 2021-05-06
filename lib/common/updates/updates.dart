import 'dart:async';

abstract class UpdateVisitor {}

abstract class Update<T extends UpdateVisitor> {
  void _acceptGenericVisitor(UpdateVisitor visitor) {
    if (visitor is T) accept(visitor);
  }

  void accept(T visitor);
}

abstract class Updates extends Stream<Update> {}

extension UpdateVisitorExt on UpdateVisitor {
  void _onUpdate(Update update) => update._acceptGenericVisitor(this);

  StreamSubscription<Update> subscribe(Updates updates) => updates.listen(_onUpdate);
}
