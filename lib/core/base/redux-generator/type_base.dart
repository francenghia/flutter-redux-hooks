abstract class StateCloneable<T extends StateCloneable<T>> {
  T clone();
}

class Action {
  const Action(this.type, {this.payload});
  final Object type;
  final dynamic payload;
}

typedef CreateReducer<T> = T Function(T state, Action action);