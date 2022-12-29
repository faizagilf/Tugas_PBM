// ignore_for_file: prefer_const_constructors

import 'package:uaspbm/form_create.dart';
import 'package:uaspbm/form_update.dart';
import 'package:uaspbm/login.dart';
import 'package:flutter/material.dart';
import 'package:uaspbm/db_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? username = '';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      username = (prefs.getString('usernameUser') ?? '');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome $username'),
        actions: [
          IconButton(
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                prefs.remove("usernameUser");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Consumer<DbProvider>(
        builder: (context, provider, child) {
          final belanjas = provider.belanjas;

          return ListView.builder(
            itemCount: belanjas.length,
            itemBuilder: (context, index) {
              final belanja = belanjas[index];
              return Dismissible(
                key: Key(belanja.id.toString()),
                background: Container(color: Colors.red),
                onDismissed: (direction) {
                },
                child: Card(
                  child: ListTile(
                    leading: const Icon(
                      Icons.person_rounded,
                      size: 50,
                    ),
                    title: Text(belanja.nama),
                    subtitle: Text(belanja.barang),
                    onTap: () async {
                    },
                    trailing: FittedBox(
                      fit: BoxFit.fill,
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            FormUpdatePage(belanja: belanja)));
                              },
                              icon: const Icon(Icons.edit)),
                          IconButton(
                              onPressed: () {
                                AlertDialog hapus = AlertDialog(
                                  title: const Text("Informasi"),
                                  content: SizedBox(
                                    height: 50,
                                    child: Column(
                                      children: [
                                        Text(
                                            "Anda ingin menghapus data ${belanja.nama}?")
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Provider.of<DbProvider>(context,
                                                  listen: false)
                                              .delBelanja(belanja, index);
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Ya")),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Tidak"))
                                  ],
                                );
                                showDialog(
                                    context: context,
                                    builder: (context) => hapus);
                              },
                              icon: Icon(Icons.delete))
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const FormCreatePage()));
        },
      ),
    );
  }
}
