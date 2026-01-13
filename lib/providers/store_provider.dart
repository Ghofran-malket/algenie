// providers/store_provider.dart
import 'package:algenie/data/models/nearby_store_model.dart';
import 'package:algenie/services/customer_services.dart';
import 'package:flutter/material.dart';

class StoreProvider extends ChangeNotifier {
  final CustomerService service = CustomerService();

  List<NearbyStore> _nearByStores = [];
  bool _isLoading = false;
  bool _isFetched = false;

  List<NearbyStore> get nearbyStores => _nearByStores;
  bool get isLoading => _isLoading;

  Future<void> fetchStores() async {
    if (_isFetched) return;
    _isLoading = true;
    notifyListeners();

    try {
      _nearByStores = await service.getNearbyStoresList();
      _isFetched = true;
    } catch (e) {
      print(e.toString());
      _nearByStores = [];
    }
    
    _isLoading = false;
    notifyListeners();
  }
}