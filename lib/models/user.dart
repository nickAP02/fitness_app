class UserModel {
  late String? id;
  late String? username;
  late String? avatar;
  late String? email;
  late String? sex;
  late String? country;
  late String? city;
  UserModel({
    this.id,
    this.username,
    this.avatar,
    this.email,
    this.sex,
    this.country,
    this.city
  });
  factory UserModel.fromJson(Map<String,dynamic>json){
    return UserModel(
      id:json["id"]??"",
      username: json["username"]??"",
      avatar: json["avatar"]??"",
      email: json["email"]??"",
      sex: json["sex"]??"",
      country: json["country"]??"",
      city: json["city"]??""
    );
  }
  Map<String, dynamic> toJson() => {
    'id':id,
    'username':username,
    'avatar':avatar,
    'email':email,
    'sex':sex,
    'country':country,
    'city':city
  };
}