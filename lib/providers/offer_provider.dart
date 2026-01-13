import 'package:algenie/data/models/offer_model.dart';
import 'package:algenie/services/customer_services.dart';
import 'package:flutter/material.dart';

class OfferProvider extends ChangeNotifier {
  final CustomerService service = CustomerService();

  List<Offer> _offers = [];
  bool _isLoading = false;
  bool _isFetched = false;

  List<Offer> get offers => _offers;
  bool get isLoading => _isLoading;

  Future<void> fetchOffers() async {
    if (_isFetched) return;
    _isLoading = true;
    notifyListeners();

    try {
      _offers = await service.getOffersList();
      _isFetched = true;
    } catch (e) {
      print(e.toString());
      _offers = [];
    }
    
    _isLoading = false;
    notifyListeners();
  }
}