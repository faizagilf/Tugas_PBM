import 'package:flutter/material.dart';
import 'package:tugas7/db_provider.dart';
import 'package:tugas7/customer.dart';
import 'package:provider/provider.dart';

class FormCreatePage extends StatefulWidget {
  final Customer? customer;

  const FormCreatePage({Key? key, this.customer}) : super(key: key);

  @override
  State<FormCreatePage> createState() => _FormCreatePageState();
}

class _FormCreatePageState extends State<FormCreatePage> {
  TextEditingController? nama;
  TextEditingController? npm;
  // bool _isUpdate = false;

  @override
  void initState() {
    nama = TextEditingController(
        text: widget.customer == null ? '' : widget.customer!.nama);
    npm = TextEditingController(
        text: widget.customer == null ? '' : widget.customer!.npm);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              controller: nama,
              decoration: const InputDecoration(
                labelText: 'Nama',
              ),
            ),
            TextField(
              controller: npm,
              decoration: const InputDecoration(
                labelText: 'NPM',
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: const Text('Simpan'),
                onPressed: () async {
                  final customer = Customer(
                    nama: nama!.text,
                    npm: npm!.text,
                  );
                  Provider.of<DbProvider>(context, listen: false)
                      .addCustomer(customer);
                  Navigator.pop(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    nama!.dispose();
    npm!.dispose();
    super.dispose();
  }
}
