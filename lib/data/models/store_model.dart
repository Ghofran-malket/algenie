import 'package:geolocator/geolocator.dart';

class Store {
  String id;
  String name;
  String title;
  Position? location;
  String image;
  String  address;
  String number;
  int  ratings;
  String  openAt;
  String closeAt;

  Store({required this.id, required this.name, required this.title,required this.location, required this.image,
          required this.address, required this.number, required this.ratings, required this.openAt, required this.closeAt});

  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(
      id: json['_id'],
      name: json['name'],
      title: json['title'],
      location: Position(
        longitude: json['storeLocation']['longitude'],
        latitude: json['storeLocation']['latitude'],
        accuracy: 0.0,
        timestamp: DateTime.now(),
        altitude: 0.0,
        altitudeAccuracy: 0.0,
        heading: 0.0,
        headingAccuracy: 0.0,
        speed: 0.0,
        speedAccuracy: 0.0,
      ),
      image: json['image'],
      address: json['address'],
      number: json['number'],
      ratings: json['ratings'],
      openAt: json['openAt'],
      closeAt: json['closeAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'title': title,
      'storeLocation.longitude': location?.longitude,
      'storeLocation.latitude': location?.latitude,
      'image': image,
      'address': address,
      'number': number,
      'ratings': ratings,
      'openAt': openAt,
      'closeAt': closeAt,
    };
  }
}