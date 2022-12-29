import 'package:flutter/material.dart';
import 'package:uaspbm/db_provider.dart';
import 'package:uaspbm/belanja.dart';
import 'package:provider/provider.dart';

class FormUpdatePage extends StatefulWidget {
  final Belanja? belanja;

  const FormUpdatePage({Key? key, this.belanja}) : super(key: key);

  @override
  State<FormUpdatePage> createState() => _FormUpdatePageState();
}

class _FormUpdatePageState extends State<FormUpdatePage> {
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
                    id: widget.belanja!.id!,
                    nama: nama!.text,
                    barang: barang!.text,
                  );
                  Provider.of<DbProvider>(context, listen: false)
                      .upBelanja(belanja);
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
