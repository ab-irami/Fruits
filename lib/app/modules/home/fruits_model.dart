class Fruits {
  String? seller;
  String? product;
  String? variety;
  int? price;
  int? avgWeight;
  int? perBox;
  int? boxes;
  String? delivery;

  Fruits(
      {this.seller,
      this.product,
      this.variety,
      this.price,
      this.avgWeight,
      this.perBox,
      this.boxes,
      this.delivery});

  Fruits.fromJson(Map<String, dynamic> json) {
    seller = json['Seller'];
    product = json['Product'];
    variety = json['Variety'];
    price = json['Price'];
    avgWeight = json['AvgWeight'];
    perBox = json['PerBox'];
    boxes = json['Boxes'];
    delivery = json['Delivery'];
  }

}
