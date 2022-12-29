// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:tugas8/dashboard/dashboard.dart';
import 'package:tugas8/login/state_management/state_management.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginUi extends StatefulWidget {
  const LoginUi({Key? key}) : super(key: key);

  @override
  State<LoginUi> createState() => _LoginUiState();
}

class _LoginUiState extends State<LoginUi> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 50),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Hai! Selamat Datang',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            SizedBox(height: 50),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                obscureText: context.watch<StateProvider>().passenable,
                controller: passwordController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    onPressed: () => context.read<StateProvider>().state(),
                    icon: Icon(context.read<StateProvider>().passenable == true
                        ? Icons.remove_red_eye
                        : Icons.remove_red_eye_outlined),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              decoration:
                  BoxDecoration(color: Colors.black54, shape: BoxShape.circle),
              child: ElevatedButton(
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: const Text('Login')),
                onPressed: () async {
                  if (nameController.text == "" &&
                      passwordController.text == "") {
                    print("Tidak Bisa Login!");
                  } else if (nameController.text == "" ||
                      passwordController.text == "") {
                    print("Tidak Bisa Login!");
                  } else {
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => Dashboard()));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
