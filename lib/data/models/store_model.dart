import 'package:algenie/data/models/item_model.dart';

class Store {
  String name;
  String title;
  List<Item> items;

  Store({required this.name, required this.title, required this.items, });


  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(
      name: json['name'],
      title: json['title'],
      items: (json['items'] as List).map((itemJson) => Item.fromJson(itemJson)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'title': title,
      'items': items.map((item) => item.toJson()).toList()
    };
  }
}