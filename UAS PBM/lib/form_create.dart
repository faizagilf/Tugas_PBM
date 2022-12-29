import 'package:flutter/material.dart';
import 'package:uaspbm/db_provider.dart';
import 'package:uaspbm/belanja.dart';
import 'package:provider/provider.dart';

class FormCreatePage extends StatefulWidget {
  final Belanja? belanja;

  const FormCreatePage({Key? key, this.belanja}) : super(key: key);

  @override
  State<FormCreatePage> createState() => _FormCreatePageState();
}

class _FormCreatePageState extends State<FormCreatePage> {
  TextEditingController? nama;
  TextEditingController? barang;

  @override
  void initState() {
    nama = TextEditingController(
        text: widget.belanja == null ? '' : widget.belanja!.nama);
    barang = TextEditingController(
        text: widget.belanja == null ? '' : widget.belanja!.barang);
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
              controller: barang,
              decoration: const InputDecoration(
                labelText: 'Barang',
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: const Text('Simpan'),
                onPressed: () async {
                  final belanja = Belanja(
                    nama: nama!.text,
                    barang: barang!.text,
                  );
                  Provider.of<DbProvider>(context, listen: false)
                      .addBelanja(belanja);
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
    barang!.dispose();
    super.dispose();
  }
}
