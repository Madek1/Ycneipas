import 'package:flutter/material.dart';
import 'package:untitled/store/models/user_model.dart';

@immutable
class UserState {
  final bool isError;
  final bool isLogging;
  final UserModel? user;

  UserState({
    required this.isError,
    required this.isLogging,
    required this.user,
  });

  factory UserState.initial() => UserState(
        isError: false,
        isLogging: false,
        user: null,
      );

  UserState copyWith({
    required bool isError,
    required bool isLogging,
    required UserModel user,
  }) {
    return UserState(
      isError: isError ?? this.isError,
      isLogging: isLogging ?? this.isLogging,
      user: user ?? this.user,
    );
  }
}
