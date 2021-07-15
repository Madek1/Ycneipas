import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:untitled/store/models/user_model.dart';
import 'package:untitled/store/redux/user/user_actions.dart';
import 'package:untitled/store/store.dart';
import 'package:untitled/widgets/templates/t_page.dart';

class HomePage extends StatefulWidget {
  HomePage();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  void _logIn() {
    Redux.store.dispatch(logInAction);
  }

  @override
  Widget build(BuildContext context) {
    return TPage(
      appBar: AppBar(
        title: Text('Ycneipas'),
      ),
      body: <Widget>[
        StoreConnector<AppState, UserModel?>(
          builder: (context, user) {
            if (user != null) {
              return Text(user.firebaseDetails!.displayName!);
            }
            return ElevatedButton(
              onPressed: _logIn,
              child: Text('Log in'),
            );
          },
          converter: (store) => store.state.userState.user,
        ),
        Text(
          'Lorem ipsum',
        ),
      ],
    );
  }
}
