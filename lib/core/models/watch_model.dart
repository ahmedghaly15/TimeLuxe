class WatchModel {
  String? name;
  String? imageUrl;
  double? price;

  WatchModel({
    this.name,
    this.imageUrl,
    this.price,
  });

  WatchModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    imageUrl = json['imageUrl'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'imageUrl': imageUrl,
      'price': price,
    };
  }
}
