import 'package:uaspbm/dashboard.dart';
import 'package:uaspbm/db_provider.dart';
import 'package:uaspbm/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final String? username = prefs.getString('usernameUser');

  runApp(MyApp(username: username));
}

class MyApp extends StatelessWidget {
  final String? username;
  const MyApp({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DbProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: username == null ? const Splash() : const Dashboard(),
      ),
    );
  }
}
