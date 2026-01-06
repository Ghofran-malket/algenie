import 'package:algenie/data/models/store_model.dart';

abstract class DetailsData {
  String get title;
  String get description;
  String get image;
  String? get discountPercentage;
  String get price;
  String get category;
  Store get store;
  DateTime? get startDate;
  DateTime? get expireDate;
}