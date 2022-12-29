// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:uaspbm/database_helper.dart';
import 'package:uaspbm/belanja.dart';

class DbProvider extends ChangeNotifier {
  late DatabaseHelper _dbHelper;
  List<Belanja> _belanjas = [];
  List<Belanja> get belanjas => _belanjas;

  DbProvider() {
    _dbHelper = DatabaseHelper();
    _getAllBelanjas();
  }

  void _getAllBelanjas() async {
    _belanjas = await _dbHelper.getBelanjas();
    notifyListeners();
  }

  Future<void> addBelanja(Belanja belanja) async {
    await _dbHelper.insertBelanja(belanja);
    _getAllBelanjas();
  }

  Future<void> delBelanja(Belanja belanja, int position) async {
    await _dbHelper.deleteBelanja(belanja.id!);
    print(belanja.barang);
    _getAllBelanjas();
  }

  Future<void> upBelanja(Belanja belanja) async {
    await _dbHelper.updateBelanja(belanja);
    _getAllBelanjas();
  }
}
