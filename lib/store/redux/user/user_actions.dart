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

Future<void> logInAction(Store<AppState> store) async {
  store.dispatch(
    SetUserStateAction(
      UserState(
        isLogging: true,
        isError: false,
      ),
    ),
  );
  try {
    await Future.delayed(const Duration(seconds: 1), () {
      store.dispatch(
        SetUserStateAction(
          UserState(
            isLogging: false,
            user: UserModel(
              firebaseDetails: null,
            ),
          ),
        ),
      );
    });
  } catch (error) {
    store.dispatch(
      SetUserStateAction(
        UserState(
          isLogging: false,
          isError: true,
        ),
      ),
    );
  }
}
