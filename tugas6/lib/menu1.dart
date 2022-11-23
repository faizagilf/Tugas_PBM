import 'package:flutter/material.dart';
import 'package:tugas6/menu2.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Menu1 extends StatefulWidget {
  const Menu1({super.key});

  @override
  State<Menu1> createState() => _Menu1State();
}

class _Menu1State extends State<Menu1> {
  final Future<SharedPreferences> _preference = SharedPreferences.getInstance();
  bool _isBool = false;

  //1
  void _Boolean() async {
    final SharedPreferences prefs = await _preference;
    setState(() {
      _isBool = !_isBool;
      if (_isBool == true) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const Menu2()));
      } else {}
    });
    prefs.setBool('isbool', _isBool);
  }

  //2
  _getBool() async {
    final SharedPreferences prefs = await _preference;
    setState(() {
      _isBool = prefs.getBool('isbool') ?? _isBool;
      if (_isBool == true) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const Menu2()));
      } else {}
    });
  }

  @override
  void initState() {
    super.initState();
    _getBool();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 99, 184, 244), shape: BoxShape.circle),
                    child: const Center(
                        child:
                            Icon(Icons.person, size: 50, color: Colors.white)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Login",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        prefixIcon: Icon(
                          Icons.email,
                          size: 40,
                        ),
                        hintText: "Masukkan Email",
                        hintStyle: TextStyle(color: Colors.black),
                        labelText: "Email",
                        labelStyle: TextStyle(color: Colors.black)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        prefixIcon: Icon(
                          Icons.lock,
                          size: 40,
                        ),
                        hintText: "Masukkan Password",
                        hintStyle: TextStyle(color: Colors.black),
                        labelText: "Password",
                        labelStyle: TextStyle(color: Colors.black)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Card(
                    color: Color.fromARGB(255, 99, 184, 244),
                    elevation: 5,
                    child: SizedBox(
                      height: 50,
                      child: InkWell(
                        splashColor: Colors.white,
                        onTap: _Boolean,
                        child: const Center(
                          child: Text(
                            "Masuk",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
