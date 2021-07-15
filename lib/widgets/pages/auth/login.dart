import 'package:flutter/material.dart';
import 'package:untitled/utils/todo.dart';
import 'package:untitled/widgets/organisms/o_sign_in_form.dart';
import 'package:untitled/widgets/templates/t_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage();

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  @TODO('Create form with email and password inputs, sign in button')
  Widget build(BuildContext context) {
    return TPage(
      appBar: AppBar(
        title: Text('Sign in'),
      ),
      body: <Widget>[
        OSignInForm(),
      ],
    );
  }
}
