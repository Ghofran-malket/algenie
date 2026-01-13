import 'package:algenie/data/models/item_model.dart';
import 'package:algenie/services/customer_services.dart';
import 'package:flutter/material.dart';

class ItemsSubProvider extends ChangeNotifier {
  final String storeId;
  final CustomerService service = CustomerService();

  ItemsSubProvider({required this.storeId});

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
      _items = await service.getItemsByStoreId(storeId);
      _isFetched = true;
    } catch (e) {
      print(e.toString());
      _items = [];
    }
    
    _isLoading = false;
    notifyListeners();
  }
}