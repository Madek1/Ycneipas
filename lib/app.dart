import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:untitled/config/themes/app_theme.dart';
import 'package:untitled/store/store.dart';
import 'package:untitled/widgets/pages/auth/auth_type.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ycneipas',
      theme: AppTheme.themeData,
      home: StoreProvider<AppState>(
        store: Redux.store,
        child: AuthTypePage(),
      ),
    );
  }
}
