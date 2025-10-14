import 'package:algenie/data/models/store_model.dart';
import 'package:geolocator/geolocator.dart';

class Order {
  String genieId;
  String orderId;
  String customerId;
  String orderStatus;
  List<Store> stores;
  DateTime? createdAt;
  Position? orderLocation;
  DateTime? updatedAt;

  Order({required this.genieId, required this.orderId, required this.customerId, required this.stores, required this.orderStatus, this.createdAt});


  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      genieId: json['genieId'] ,
      orderId: json['orderId'],
      customerId: json['customerId'],
      stores: (json['stores'] as List).map( (storeJson) => Store.fromJson(storeJson)).toList(),
      orderStatus: json['orderStatus'],
      createdAt: DateTime.parse(json['createdAt'])
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'genieId': genieId,
      'orderId': orderId,
      'customerId': customerId,
      'stores': stores.map((store)=> store.toJson()).toList(),
      'orderStatus': orderStatus,
      'createdAt': createdAt
    };
  }
}