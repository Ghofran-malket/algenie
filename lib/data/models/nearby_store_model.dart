import 'package:algenie/data/models/store_model.dart';

class NearbyStore {
  final Store store;
  final String distance;

  NearbyStore({
    required this.store,
    required this.distance,
  });

  factory NearbyStore.fromJson(Map<String, dynamic> json) {
    return NearbyStore(
      store: Store.fromJson(json['store']),
      distance: double.parse(json['distance'].toStringAsFixed(3)) < 1 ? 
        "${(double.parse(json['distance'].toStringAsFixed(3))*1000).toInt()} M"
        : "${json["distance"].toStringAsFixed(3)} KM",
    );
  }
}
