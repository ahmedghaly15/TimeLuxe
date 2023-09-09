class FavoriteModel {
  int? id;
  String name;
  String? description;
  String image;
  double price;

  FavoriteModel({
    this.id,
    required this.name,
    this.description =
        "The Lady-Datejust comes in a wealth of versions to perfectly reflect the different personalities of its wearers. The range of materials and colours of the Lady-Datejust is equalled only by the variety of bracelets and dials that add to its style.",
    required this.image,
    required this.price,
  });
}
