class Item {
  String title;
  String quantity;

  Item({required this.title, required this.quantity});


  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      title: json['title'] ,
      quantity: json['quantity']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'quantity': quantity
    };
  }
}