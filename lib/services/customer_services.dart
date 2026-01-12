import 'dart:convert';
import 'package:algenie/data/models/item_model.dart';
import 'package:algenie/data/models/nearby_store_model.dart';
import 'package:algenie/data/models/offer_model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class CustomerService {
  final String baseUrl = "http://192.168.1.89:3000/api/";

  //get offers list
  Future getOffersList() async {
    final response = await http.get(
      Uri.parse('${baseUrl}offers/getOffers'),
      headers: {'Content-Type': 'application/json'}
    );

    if(response.statusCode == 200){
      final List data = jsonDecode(response.body);
      final List<Offer> offers = data.map((e) => Offer.fromJson(e)).toList();
      return offers;
    }else {
      throw Exception('Failed to getOffersList');
    }
  }

  // get items list
  Future<List<Item>> getItemsList() async {
    try{
      final response = await http.get(
        Uri.parse('${baseUrl}items/getItems'),
        headers: {'Content-Type': 'application/json'}
      );

      if(response.statusCode == 200){
        final List data = jsonDecode(response.body);
        final List<Item> items = data.map((e) => Item.fromJson(e)).toList();
        return items;
      }else {
        throw Exception('Failed to getItemsList');
      }
    }catch (e){
      print("Failed to getItemsList ${e.toString()}");
      return [];
    }
  }

  // get nearby stores list
  Future<List<NearbyStore>> getNearbyStoresList(Position myLocation, int raduis) async {
    try{
      final response = await http.get(
        Uri.parse('${baseUrl}stores/getNearbyStores/?latitude=${myLocation.latitude}&&longitude=${myLocation.longitude}&&radius=$raduis'),
        headers: {'Content-Type': 'application/json'}
      );

      if(response.statusCode == 200){
        final Map<String, dynamic> data = jsonDecode(response.body);
        final List<dynamic> storesList = data['stores'];
        final List<NearbyStore> stores = storesList.map((item) => NearbyStore.fromJson(item)).toList();
        return stores;
      }else {
        throw Exception('Failed to getNearbyStoresList');
      }
    }catch (e){
      print("Failed to getNearbyStoresList ${e.toString()}");
      return [];
    }
  }

  // get items list by store id
  Future<List<Item>> getItemsByStoreId(String storeId) async {
    try{
      final response = await http.get(
        Uri.parse('${baseUrl}items/getItemsByStoreId/?storeId=$storeId'),
        headers: {'Content-Type': 'application/json'}
      );

      if(response.statusCode == 200){
        final List<dynamic> data = jsonDecode(response.body);
        final List<Item> items = data.map((e) => Item.fromJson(e)).toList();
        return items;
      }else {
        throw Exception('Failed to getItemsByStoreId');
      }
    }catch (e){
      print("Failed to getItemsByStoreId ${e.toString()}");
      return [];
    }
  }

}