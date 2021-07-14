import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:untitled/store/redux/user/user_actions.dart';
import 'package:untitled/store/redux/user/user_reducer.dart';
import 'package:untitled/store/redux/user/user_state.dart';
import 'package:untitled/store/redux/wallet/wallet_actions.dart';
import 'package:untitled/store/redux/wallet/wallet_reducer.dart';
import 'package:untitled/store/redux/wallet/wallet_state.dart';

@immutable
class AppState {
  final UserState userState;
  final WalletsState walletsState;

  AppState({
    required this.userState,
    required this.walletsState,
  });

  AppState copyWith({
    UserState? userState,
    WalletsState? walletsState,
  }) {
    return AppState(
      userState: userState ?? this.userState,
      walletsState: walletsState ?? this.walletsState,
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
  if (action is WalletStateActions) {
    final WalletsState newWalletsState = walletsReducer(
      state.walletsState,
      action,
    );
    return state.copyWith(
      walletsState: newWalletsState,
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
    final WalletsState initialWalletsState = WalletsState.initial();
    _store = Store<AppState>(
      appReducer,
      middleware: [],
      initialState: AppState(
        userState: initialUserState,
        walletsState: initialWalletsState,
      ),
    );
  }
}
