import 'package:flutter/material.dart';
import 'package:untitled/store/redux/user/user_state.dart';

@immutable
abstract class UserStateActions {
  final UserState userState;

  UserStateActions(
    this.userState,
  );
}

@immutable
class SetUserStateAction extends UserStateActions {
  SetUserStateAction(UserState userState) : super(userState);
}

@immutable
class ClearUserStateAction extends UserStateActions {
  ClearUserStateAction(UserState userState) : super(userState);
}
