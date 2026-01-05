class OrderItem {
  String title;
  String quantity;

  OrderItem({required this.title, required this.quantity});


  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
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