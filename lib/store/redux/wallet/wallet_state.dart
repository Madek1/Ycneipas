import 'package:flutter/material.dart';
import 'package:untitled/store/models/wallet_model.dart';

@immutable
class WalletsState {
  final bool isError;
  final bool isLoading;
  final List<WalletModel> wallets;

  WalletsState({
    required this.isError,
    required this.isLoading,
    required this.wallets,
  });

  factory WalletsState.initial() => WalletsState(
        isError: false,
        isLoading: false,
        wallets: const [],
      );

  WalletsState copyWith({
    bool? isError,
    bool? isLoading,
    List<WalletModel>? wallets,
  }) {
    return WalletsState(
      isError: isError ?? this.isError,
      isLoading: isLoading ?? this.isLoading,
      wallets: wallets ?? this.wallets,
    );
  }
}
