import 'dart:convert';
import 'package:algenie/data/models/offer_model.dart';
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

}