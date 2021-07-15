import 'package:flutter/material.dart';
import 'package:untitled/utils/todo.dart';
import 'package:untitled/widgets/organisms/o_sign_up_form.dart';
import 'package:untitled/widgets/templates/t_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage();

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  @TODO('Create form with email and password inputs, sign in button')
  Widget build(BuildContext context) {
    return TPage(
      appBar: AppBar(
        title: Text('Sign up'),
      ),
      body: <Widget>[
        OSignUpForm(),
      ],
    );
  }
}
