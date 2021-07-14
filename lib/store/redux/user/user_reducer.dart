import 'package:untitled/store/redux/user/user_actions.dart';
import 'package:untitled/store/redux/user/user_state.dart';

UserState userReducer(UserState prevState, UserStateActions action) {
  final UserState payload = action.userState;
  if (action is SetUserStateAction) {
    return prevState.copyWith(
      isError: payload.isError,
      isLogging: payload.isLogging,
      user: payload.user!,
    );
  }
  return prevState;
}
