import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled/routes/router_management.dart';
import 'package:untitled/routes/routes.dart';
import 'package:untitled/store/models/user_model.dart';
import 'package:untitled/store/redux/user/user_actions.dart';
import 'package:untitled/store/redux/user/user_state.dart';
import 'package:untitled/store/store.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

mixin Authentication {
  void _signedIn(BuildContext context, User user) {
    Redux.store.dispatch(
      SetUserStateAction(
        UserState(
          user: UserModel(
            firebaseDetails: user,
          ),
        ),
      ),
    );
    RouterManagement.pushReplacement(context, Routes.home);
  }

  void _signedOut(BuildContext context) {
    Redux.store.dispatch(
      SetUserStateAction(
        UserState(
          user: UserModel(
            firebaseDetails: null,
          ),
        ),
      ),
    );
    RouterManagement.pushReplacement(context, Routes.authType);
  }

  Future<void> signInWithEmailAndPassword(
    BuildContext context, {
    required String email,
    required String password,
  }) async {
    try {
      final User? user = (await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      ))
          .user;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${user!.email} signed in'),
        ),
      );
      _signedIn(context, user);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to sign in with Email & Password'),
        ),
      );
    }
  }

  Future<void> signUp(
    BuildContext context, {
    required String email,
    required String password,
  }) async {
    try {
      final User user = (await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ))
          .user!;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Signed up'),
        ),
      );
      _signedIn(context, user);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to sign up'),
        ),
      );
    }
  }

  Future<void> signOut(BuildContext context) async {
    try {
      await _auth.signOut();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Signed out'),
        ),
      );
      _signedOut(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to sign out'),
        ),
      );
    }
  }
}
