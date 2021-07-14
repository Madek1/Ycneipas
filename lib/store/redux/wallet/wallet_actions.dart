import 'package:flutter/material.dart';
import 'package:untitled/store/redux/wallet/wallet_state.dart';

@immutable
abstract class WalletStateActions {
  final WalletsState walletsState;

  WalletStateActions(
    this.walletsState,
  );
}

@immutable
class SetWalletStateActions extends WalletStateActions {
  SetWalletStateActions(WalletsState walletsState) : super(walletsState);
}

@immutable
class AddWalletStateActions extends WalletStateActions {
  AddWalletStateActions(WalletsState walletsState) : super(walletsState);
}
