import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:untitled/routes/router_management.dart';
import 'package:untitled/routes/routes.dart';
import 'package:untitled/store/models/user_model.dart';
import 'package:untitled/store/redux/user/user_actions.dart';
import 'package:untitled/store/redux/user/user_state.dart';
import 'package:untitled/store/store.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class OSignInForm extends StatefulWidget {
  const OSignInForm();

  @override
  _OSignInFormState createState() => _OSignInFormState();
}

class _OSignInFormState extends State<OSignInForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  Future<void> _signInWithEmailAndPassword() async {
    try {
      final User? user = (await _auth.signInWithEmailAndPassword(
        email: _email.text,
        password: _password.text,
      ))
          .user;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${user!.email} signed in'),
        ),
      );
      Redux.store.dispatch(
        SetUserStateAction(
          UserState(
            user: UserModel(
              firebaseDetails: user,
            ),
          ),
        ),
      );
      RouterManagement.push(context, Routes.home);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to sign in with Email & Password'),
        ),
      );
    }
  }

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
                      await _signInWithEmailAndPassword();
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
