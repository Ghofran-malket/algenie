import 'package:algenie/data/models/item_model.dart';
import 'package:algenie/services/customer_services.dart';
import 'package:flutter/material.dart';

class ItemProvider extends ChangeNotifier {
  final CustomerService service = CustomerService();

  List<Item> _items = [];
  bool _isLoading = false;
  bool _isFetched = false;

  List<Item> get items => _items;
  bool get isLoading => _isLoading;

  Future<void> fetchItems() async {
    if (_isFetched) return;
    _isLoading = true;
    notifyListeners();

    try {
      _items = await service.getItemsList();
      _isFetched = true;
    } catch (e) {
      print(e.toString());
      _items = [];
    }
    
    _isLoading = false;
    notifyListeners();
  }
}