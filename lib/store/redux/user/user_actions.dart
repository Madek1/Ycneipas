import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:untitled/store/models/user_model.dart';
import 'package:untitled/store/redux/user/user_state.dart';
import 'package:untitled/store/store.dart';

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

Future<void> logIn(Store<AppState> store) async {
  store.dispatch(
    SetUserStateAction(
      UserState(
        isLogging: false,
        user: UserModel(
          uid: 'c7282cf2-e4ce-11eb-ba80-0242ac130004',
          name: 'Michal',
          surname: 'Bilski',
        ),
      ),
    ),
  );
}
