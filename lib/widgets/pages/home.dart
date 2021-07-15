import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:untitled/store/models/user_model.dart';
import 'package:untitled/store/store.dart';
import 'package:untitled/widgets/templates/t_page.dart';

class HomePage extends StatefulWidget {
  HomePage();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return TPage(
      appBar: AppBar(
        title: Text('Ycneipas'),
      ),
      body: <Widget>[
        StoreConnector<AppState, UserModel?>(
          builder: (context, user) {
            return Text(user!.firebaseDetails!.email!);
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
