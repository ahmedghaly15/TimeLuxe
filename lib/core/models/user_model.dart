class UserModel {
  String? name;
  String? email;
  String? uId;
  String? password;

  UserModel({
    this.name,
    this.email,
    this.uId,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    uId = json['uId'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'uId': uId,
    };
  }
}
