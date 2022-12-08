import 'package:flutter/material.dart';
import 'package:tugas7/db_provider.dart';
import 'package:tugas7/customer.dart';
import 'package:provider/provider.dart';

class FormUpdatePage extends StatefulWidget {
  final Customer? customer;

  const FormUpdatePage({Key? key, this.customer}) : super(key: key);

  @override
  State<FormUpdatePage> createState() => _FormUpdatePageState();
}

class _FormUpdatePageState extends State<FormUpdatePage> {
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
    // if (widget.customer != null) {
    //   _titleController.text = widget.customer!.title;
    //   _descriptionController.text = widget.customer!.npm;
    //   // _isUpdate = true;
    // }
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
                    id: widget.customer!.id!,
                    nama: nama!.text,
                    npm: npm!.text,
                  );
                  Provider.of<DbProvider>(context, listen: false)
                      .upCustomer(customer);
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
