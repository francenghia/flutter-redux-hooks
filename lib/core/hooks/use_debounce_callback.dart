import 'package:flutter_hooks/flutter_hooks.dart';

typedef DebounceCallback = void Function();

DebounceCallback useDebounceCallback<DebounceCallback>(
    Duration duration, DebounceCallback onExecute) {
  final state = useState(onExecute);

  return state.value;
}
