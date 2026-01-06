import 'package:algenie/core/models/details_data_model.dart';
import 'package:algenie/data/models/store_model.dart';

class Offer implements DetailsData {
  @override String title;
  @override String description;
  @override String image;
  @override String discountPercentage;
  @override String price;
  @override DateTime startDate;
  @override DateTime expireDate;
  @override String category;
  @override Store store;

  Offer({required this.title, required this.description, required this.image, required this.discountPercentage,
   required this.price, required this.startDate, required this.expireDate, required this.category, required this.store});

  factory Offer.fromJson(Map<String, dynamic> json) {
    return Offer(
      title: json['title'],
      description: json['description'],
      image: json['image'],
      discountPercentage: json['discountPercentage'],
      price: json['price'],
      startDate: DateTime.parse(json['startDate']),
      expireDate: DateTime.parse(json['expireDate']),
      category: json['category'],
      store: Store.fromJson(json['store'])
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'image': image,
      'discountPercentage': discountPercentage,
      'price': price,
      'startDate': startDate,
      'expireDate': expireDate,
      'category': category,
      'store': store.toJson()
    };
  }
}