import 'package:flutter/material.dart';
import 'package:untitled/widgets/organisms/o_sign_in_form.dart';
import 'package:untitled/widgets/templates/t_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage() : super();

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
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
