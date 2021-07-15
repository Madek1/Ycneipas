import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled/utils/todo.dart';
import 'package:untitled/widgets/organisms/o_sign_up_form.dart';
import 'package:untitled/widgets/templates/t_page.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class RegisterPage extends StatefulWidget {
  const RegisterPage();

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
      appBar: AppBar(
        title: Text('Sign up'),
      ),
      body: <Widget>[
        OSignUpForm(),
      ],
    );
  }
}
