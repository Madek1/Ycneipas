import 'package:untitled/store/redux/wallet/wallet_actions.dart';
import 'package:untitled/store/redux/wallet/wallet_state.dart';

WalletsState walletsReducer(WalletsState prevState, WalletStateActions action) {
  final WalletsState payload = action.walletsState;
  if (action is AddWalletStateActions) {
    return prevState.copyWith(
      isError: payload.isError,
      isLoading: payload.isLoading,
      wallets: prevState.wallets..addAll(payload.wallets),
    );
  }
  if (action is SetWalletStateActions) {
    return prevState.copyWith(
      isError: payload.isError,
      isLoading: payload.isLoading,
      wallets: payload.wallets,
    );
  }
  return prevState;
}
