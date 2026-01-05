class Item {
  String title;
  String description;
  String image;
  String price;
  String catalogue;
  String storeId;

  Item({required this.title, required this.description, required this.image, 
  required this.price, required this.catalogue, required this.storeId});


  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      title: json['title'] ,
      description: json['quantity'],
      image: json['image'],
      price: json['price'],
      catalogue: json['catalogue'],
      storeId: json['storeId']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'image': image,
      'price': price,
      'catalogue': catalogue,
      'storeId': storeId
    };
  }
}