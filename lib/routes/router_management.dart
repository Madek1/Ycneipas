import 'package:flutter/material.dart';
import 'package:untitled/routes/routes.dart';
import 'package:untitled/store/store.dart';
import 'package:untitled/utils/todo.dart';
import 'package:untitled/widgets/pages/auth/auth_type.dart';
import 'package:untitled/widgets/pages/auth/login.dart';
import 'package:untitled/widgets/pages/auth/register.dart';
import 'package:untitled/widgets/pages/home.dart';

@immutable
class RouterManagement {
  @TODO('Move to other file')
  static bool get isUserSingedIn {
    try {
      return Redux.store.state.userState.user!.firebaseDetails != null;
    } catch (err) {
      return false;
    }
  }

  @TODO('Refacto checking auth status')
  static Widget _getRouteWidget(Routes route) {
    switch (route) {
      case Routes.home:
        if (isUserSingedIn) {
          return HomePage();
        }
        break;
      case Routes.authType:
        if (!isUserSingedIn) {
          return AuthTypePage();
        }
        break;
      case Routes.login:
        if (!isUserSingedIn) {
          return LoginPage();
        }
        break;
      case Routes.register:
        if (!isUserSingedIn) {
          return RegisterPage();
        }
        break;
    }
    if (isUserSingedIn) {
      return HomePage();
    }
    return AuthTypePage();
  }

  static void push(BuildContext context, Routes route) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => _getRouteWidget(route),
      ),
    );
  }

  static void pushReplacement(BuildContext context, Routes route) {
    Navigator.of(context).pushReplacement(
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
