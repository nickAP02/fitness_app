

class UserEntity {
  // ignore: non_constant_identifier_names
  int? userId;
  String? username;
  String? email;
  String? description;
  String? city;
  String? avatar;
  String? sex;
  String? height;
  double? weight;
  bool? isUser;
  int? isMerchant;
  // int? subscriptionId;

  UserEntity({
    required this.userId,
    required this.username,
    required this.email,
    required this.description,
    required this.city,
    this.avatar,
    required this.sex,
    required this.height,
    required this.weight,
    required this.isUser,
    required this.isMerchant,
    // this.subscriptionId
  });

  factory UserEntity.fromJson(Map<String,dynamic>json){
    return UserEntity(
      userId: json["user_id"],
      username: json["username"],
      email: json["email"],
      description: json["description"],
      city: json["city"],
      avatar: json["avatar"],
      sex: json["sex"],
      height: json["height"],
      weight: json["weight"],
      isUser: json["is_user"],
      isMerchant: json["is_merchant"],
      // subscriptionId: json["subscription_id"]
    );
  }
  Map<String,dynamic> toJson()=>{
    'username':username,
    'email':email,
    'description':description,
    'city':city,
    'avatar':avatar,
    'sex':sex,
    'height':height,
    'weight':weight,
    'is_user':isUser,
    'is_merchant':isMerchant,
    // 'subscription_id':subscriptionId
  };
}