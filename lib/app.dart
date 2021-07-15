import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:untitled/config/themes/app_theme.dart';
import 'package:untitled/routes/router_management.dart';
import 'package:untitled/store/store.dart';
import 'package:untitled/widgets/pages/auth/auth_type.dart';
import 'package:untitled/widgets/pages/home.dart';

class App extends StatelessWidget {
  Widget get initialPage {
    if (RouterManagement.isUserSingedIn) {
      return HomePage();
    }
    return AuthTypePage();
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: Redux.store,
      child: MaterialApp(
        title: 'Ycneipas',
        theme: AppTheme.themeData,
        home: StoreProvider<AppState>(
          store: Redux.store,
          child: AuthTypePage(),
        ),
      ),
    );
  }
}
