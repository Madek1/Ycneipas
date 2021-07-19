import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:untitled/mixins/authentication.dart';

class OSignInForm extends StatefulWidget {
  const OSignInForm();

  @override
  _OSignInFormState createState() => _OSignInFormState();
}

class _OSignInFormState extends State<OSignInForm> with Authentication {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: _email,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Required';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _password,
                decoration: const InputDecoration(labelText: 'Password'),
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Required';
                  }
                  return null;
                },
                obscureText: true,
                autocorrect: false,
                enableSuggestions: false,
              ),
              Container(
                padding: const EdgeInsets.only(top: 16),
                alignment: Alignment.center,
                child: SignInButton(
                  Buttons.Email,
                  text: 'Sign In',
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await signInWithEmailAndPassword(
                        context,
                        email: _email.text,
                        password: _password.text,
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
