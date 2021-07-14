import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_builder.dart';
import 'package:untitled/widgets/templates/t_page.dart';

class AuthTypePage extends StatelessWidget {
  const AuthTypePage();

  @override
  Widget build(BuildContext context) {
    return TPage(
      body: <Widget>[
        Container(
          padding: const EdgeInsets.all(16),
          alignment: Alignment.center,
          child: SignInButtonBuilder(
            icon: Icons.person_add,
            backgroundColor: Colors.indigo,
            text: 'Registration',
            onPressed: () => _pushPage(context, RegisterPage()),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          alignment: Alignment.center,
          child: SignInButtonBuilder(
            icon: Icons.verified_user,
            backgroundColor: Colors.orange,
            text: 'Sign In',
            onPressed: () => _pushPage(context, SignInPage()),
          ),
        ),
      ],
    );
  }
}
