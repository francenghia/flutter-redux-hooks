import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_redux_hooks/core/utils/index.dart';
import 'package:flutter_redux_hooks/views/login/login.actions.dart';
import 'package:flutter_redux_hooks/views/login/login.reducers.dart';
import 'package:flutter_redux_hooks/views/login/login.state.dart';
import 'package:flutter_redux_hooks/views/login/login.types.dart';

UseLoginViewModel useLoginViewModel() {
  final asReducer = useReducer<LoginState, LoginActions?>(
    loginReducers,
    initialState: initState(),
    initialAction: null,
  );

  final onEmailChange = useCallback((String email) {
    asReducer.dispatch(SetEmailAction(email: email));
  }, [asReducer]);

  final onPasswordChange = useCallback((String email) {
    asReducer.dispatch(SetPasswordAction(password: email));
  }, []);

  return UseLoginViewModel(
    state: asReducer.state,
    onEmailChange: onEmailChange,
    onPasswordChange: onPasswordChange,
    dayOfMonth: DateUtils.fullDayFormat(DateTime.now()),
  );
}
