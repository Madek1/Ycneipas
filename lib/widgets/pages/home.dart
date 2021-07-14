import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:untitled/store/models/user_model.dart';
import 'package:untitled/store/redux/user/user_actions.dart';
import 'package:untitled/store/store.dart';

class HomePage extends StatefulWidget {
  HomePage();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _logIn() {
    Redux.store.dispatch(logInAction);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ycneipas'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StoreConnector<AppState, UserModel?>(
              builder: (context, user) {
                if (user != null) {
                  return Text(user.name!);
                }
                return ElevatedButton(
                  onPressed: _logIn,
                  child: Text('Log in'),
                );
              },
              converter: (store) => store.state.userState.user,
            ),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
