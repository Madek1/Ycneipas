import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled/utils/todo.dart';
import 'package:untitled/widgets/templates/t_page.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class LoginPage extends StatefulWidget {
  const LoginPage();

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  User? user;

  @override
  void initState() {
    super.initState();
    _auth.userChanges().listen((event) => setState(() => user = event));
  }

  @override
  @TODO('Create form with email and password inputs, sign in button')
  Widget build(BuildContext context) {
    return TPage(
      body: <Widget>[],
    );
  }
}
