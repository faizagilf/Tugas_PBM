import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas 2',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(title: 'Simple Button App'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _counter = 12.0;
  var ubahnama = true;
  String namaku = "Faiz Agil Firmansyah";
  void Ubahnama() {
    setState(() {
      ubahnama = !ubahnama;
      if (ubahnama) {
        namaku = "Faiz Agil Firmansyah";
      } else {
        namaku = "faizagilf";
      }
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Anda Telah Menekan Tombol Ini Sebanyak: $_counter",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '$namaku',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,    
        children: [
          FloatingActionButton(
            onPressed: Ubahnama,
            tooltip: 'Refresh',
            child: const Icon(Icons.refresh, color: Colors.black87,),
          ),
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'increment',
            child: const Icon(Icons.add, color: Colors.black87,),

          )
        ],
      ),
    );
  }
}