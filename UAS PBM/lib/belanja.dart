class Belanja {
  late int? id;
  late String nama;
  late String barang;

  Belanja({this.id, required this.nama, required this.barang});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nama': nama,
      'barang': barang,
    };
  }

  Belanja.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    nama = map['nama'];
    barang = map['barang'];
  }
}
