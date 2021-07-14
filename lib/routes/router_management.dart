import 'package:flutter/material.dart';
import 'package:untitled/routes/routes.dart';
import 'package:untitled/widgets/pages/auth/auth_type.dart';

@immutable
class RouterManagement {
  static Widget _getRouteWidget(Routes route) {
    switch (route) {
      case Routes.authType:
        return AuthTypePage();
    }
  }

  static void push(BuildContext context, Routes route) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => _getRouteWidget(route),
      ),
    );
  }

  static void pop(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }
}
