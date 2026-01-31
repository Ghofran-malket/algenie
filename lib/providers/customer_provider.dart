import 'package:algenie/data/models/order_model.dart';
import 'package:algenie/services/customer_services.dart';
import 'package:flutter/material.dart';

class CustomerProvider extends ChangeNotifier {
  final CustomerService service = CustomerService();

  bool _isLoading = false;
  Order? _order;

  bool get isLoading => _isLoading;
  Order? get order => _order;

  Future<void> loadCustomerOrder() async {
    _isLoading = true;
    notifyListeners();

    try {
      _order = await service.getCustomerOrder();
    } catch (e) {
      print(e.toString());
      _order = null;
    }
    
    _isLoading = false;
    notifyListeners();
  }
}