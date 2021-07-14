import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:untitled/store/store.dart';
import 'package:untitled/widgets/pages/home.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ycneipas',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: StoreProvider<AppState>(
        store: Redux.store,
        child: HomePage(),
      ),
    );
  }
}
