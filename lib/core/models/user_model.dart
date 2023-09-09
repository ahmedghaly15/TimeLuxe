class UserModel {
  String? name;
  String? email;
  String? uId;
  String? password;
  String? image;

  UserModel({
    this.name,
    this.email,
    this.uId,
    this.image,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    uId = json['uId'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'uId': uId,
      'image': image,
    };
  }
}
