import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:untitled/store/redux/user/user_actions.dart';
import 'package:untitled/store/redux/user/user_reducer.dart';
import 'package:untitled/store/redux/user/user_state.dart';

@immutable
class AppState {
  final UserState userState;

  AppState({
    required this.userState,
  });

  AppState copyWith({
    UserState? userState,
  }) {
    return AppState(
      userState: userState ?? this.userState,
    );
  }
}

AppState appReducer(AppState state, dynamic action) {
  if (action is UserStateActions) {
    final UserState newUserState = userReducer(state.userState, action);
    return state.copyWith(
      userState: newUserState,
    );
  }
  return state;
}

class Redux {
  static Store<AppState>? _store;

  static Store<AppState> get store {
    if (_store == null) {
      throw Exception('Store is not initialized');
    }
    return _store!;
  }

  static Future<void> init() async {
    final UserState initialUserState = UserState.initial();
    _store = Store<AppState>(
      appReducer,
      middleware: [],
      initialState: AppState(
        userState: initialUserState,
      ),
    );
  }
}
