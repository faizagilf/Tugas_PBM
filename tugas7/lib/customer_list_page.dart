import 'package:flutter/material.dart';
import 'package:tugas7/db_provider.dart';
import 'package:tugas7/form_update.dart';
import 'package:tugas7/form_create.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas7/login.dart';

String? username = '';

class CustomerListPage extends StatefulWidget {
  const CustomerListPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CustomerListPageState createState() => _CustomerListPageState();
}

class _CustomerListPageState extends State<CustomerListPage> {
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
        title: Text('Hey! $username'),
        actions: [
          IconButton(
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                prefs.remove("usernameUser");
                // ignore: use_build_context_synchronously
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Login()));
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Consumer<DbProvider>(
        builder: (context, provider, child) {
          final customers = provider.customers;

          return ListView.builder(
            itemCount: customers.length,
            itemBuilder: (context, index) {
              final customer = customers[index];
              return Dismissible(
                key: Key(customer.id.toString()),
                background: Container(color: Colors.red),
                onDismissed: (direction) {
                  // ignore: todo
                  // TODO : Kode untuk menghapus note
                },
                child: Card(
                  child: ListTile(
                    leading: const Icon(
                      Icons.person,
                      size: 50,
                    ),
                    title: Text(customer.nama),
                    subtitle: Text(customer.npm),
                    onTap: () async {
                      // ignore: todo
                      // TODO : Kode untuk mendapatkan note yang dipilih dan dikirimkan ke NoteAddUpdatePage
                    },
                    trailing: FittedBox(
                      fit: BoxFit.fill,
                      child: Row(
                        children: [
                          //Button Edit
                          IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FormUpdatePage(
                                            customer: customer)));
                              },
                              icon: const Icon(Icons.edit)),
                          //Button Hapus
                          IconButton(
                              onPressed: () {
                                //Dialog Konformasi Hapus
                                AlertDialog hapus = AlertDialog(
                                  title: const Text("Informasi"),
                                  content: SizedBox(
                                    height: 50,
                                    child: Column(
                                      children: [
                                        Text(
                                            "Anda yakin ingin menghapus data ${customer.nama}")
                                      ],
                                    ),
                                  ),
                                  //terdapat 2 button
                                  //jika ya maka dijalankan _deleteKontak() dan tutup dialog
                                  //jika tidak maka dialog di tutup
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Provider.of<DbProvider>(context,
                                                  listen: false)
                                              .delCustomer(customer, index);
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
