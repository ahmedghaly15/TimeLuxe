class WatchModel {
  int? id;
  String? name;
  String? image;
  String? description;
  double? price;
  String? color;

  WatchModel({
    this.id,
    this.name = "Rolex",
    this.image,
    this.description =
        "The Lady-Datejust comes in a wealth of versions to perfectly reflect the different personalities of its wearers. The range of materials and colours of the Lady-Datejust is equalled only by the variety of bracelets and dials that add to its style.",
    this.price = 22.5,
    this.color = "Grey",
  });
}
