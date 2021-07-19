import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitled/app.dart';
import 'package:untitled/store/store.dart';

Future<void> main() async {
  await Redux.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase?.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyBlTrF_6gP8IdFx-uG4aFtWGNsMX2Mr1gM',
      appId: '1:113579661601:web:6305378cba623e89068660',
      messagingSenderId: '113579661601',
      projectId: 'tipbro',
    ),
  );
  runApp(App());
}
