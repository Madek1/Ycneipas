class _Currency {
  final String? walletUid;
  final String name;
  BigInt balance = BigInt.from(0);

  _Currency({
    required this.walletUid,
    required this.name,
    required this.balance,
  });
}

class WalletModel {
  final List<_Currency> currencies;

  WalletModel({
    required this.currencies,
  });
}
