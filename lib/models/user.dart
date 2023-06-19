class UserModel {
  // late String? id;
  late String? username;
  late String? email;
  late String? sex;
  late String? country;
  late String? city;
  UserModel({
    // this.id,
    this.username,
    this.email,
    this.sex,
    this.country,
    this.city
  });
  factory UserModel.fromJson(Map<String,dynamic>json){
    return UserModel(
      username: json["username"]??"",
      email: json["email"]??"",
      sex: json["sex"]??"",
      country: json["country"]??"",
      city: json["city"]??""
    );
  }
  Map<String, dynamic> toJson() => {
    'username':username,
    'email':email,
    'sex':sex,
    'country':country,
    'city':city
  };
}