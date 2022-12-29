// ignore_for_file: avoid_print, prefer_const_constructors, unused_field

import 'package:tugas8/dashboard/dashboard.dart';
import 'package:tugas8/login/login_ui.dart';
import 'package:tugas8/login/state_management/state_management.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (_) => StateProvider(),
        child: LoginUi(),
      ),
    );
  }
}
