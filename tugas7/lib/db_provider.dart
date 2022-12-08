import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:tugas7/database_helper.dart';
import 'package:tugas7/customer.dart';

class DbProvider extends ChangeNotifier {
  late DatabaseHelper _dbHelper;
  List<Customer> _customers = [];
  List<Customer> get customers => _customers;

  DbProvider() {
    _dbHelper = DatabaseHelper();
    _getAllCustomers();
  }

  void _getAllCustomers() async {
    _customers = await _dbHelper.getCustomers();
    notifyListeners();
  }

  Future<void> addCustomer(Customer customer) async {
    await _dbHelper.insertCustomer(customer);
    _getAllCustomers();
  }

  Future<void> delCustomer(Customer customer, int position) async {
    await _dbHelper.deleteCustomer(customer.id!);
    print(customer.npm);
    _getAllCustomers();
  }

  Future<void> upCustomer(Customer customer) async {
    await _dbHelper.updateCustomer(customer);
    _getAllCustomers();
  }
}
