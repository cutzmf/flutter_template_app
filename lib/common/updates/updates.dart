abstract class Update<T extends UpdateVisitor> {
  void _acceptGenericVisitor(UpdateVisitor visitor) {
    if (visitor is T) accept(visitor);
  }

  void accept(T visitor);
}

mixin UpdateVisitor {
  void handleUpdate(Update<UpdateVisitor> update) {
    update._acceptGenericVisitor(this);
  }
}
