import 'package:flutter/material.dart';
import 'package:untitled/app.dart';
import 'package:untitled/store/store.dart';

void main() async {
  await Redux.init();
  runApp(App());
}
