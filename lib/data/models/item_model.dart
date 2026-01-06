import 'package:algenie/core/models/details_data_model.dart';
import 'package:algenie/data/models/store_model.dart';

class Item implements DetailsData{
  @override String title;
  @override String description;
  @override String image;
  @override String price;
  @override String category;
  @override Store store;
  @override
  String? get discountPercentage => null;
  @override
  DateTime? get expireDate => null;
  @override
  DateTime? get startDate => null;

  Item({required this.title, required this.description, required this.image, 
  required this.price, required this.category, required this.store});


  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      title: json['title'] ,
      description: json['description'],
      image: json['image'],
      price: json['price'],
      category: json['category'],
      store: Store.fromJson(json['store'])
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'image': image,
      'price': price,
      'category': category,
      'store': store.toJson()
    };
  }
}