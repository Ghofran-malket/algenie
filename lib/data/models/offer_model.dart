class Offer {
  String title;
  String description;
  String image;
  String discountPercentage;
  String price;
  DateTime startDate;
  DateTime expireDate;
  String category;
  String storeId;



  Offer({required this.title, required this.description, required this.image, required this.discountPercentage,
   required this.price, required this.startDate, required this.expireDate, required this.category, required this.storeId});

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
      storeId: json['store']
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
      'store': storeId
    };
  }
}