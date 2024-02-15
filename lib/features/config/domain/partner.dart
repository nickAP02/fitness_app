class PartnerEntity {
  int? partnerId;
  String? name;
  String? phoneNumber;
  String? description;
  String? city;
  String? avatar;
  bool? isUser;
  int? isMerchant;
  int? subscriptionId;

  PartnerEntity({
    required this.partnerId,
    required this.name,
    required this.phoneNumber,
    required this.description,
    required this.city,
    this.avatar,
    required this.isUser,
    required this.isMerchant,
    this.subscriptionId
  });

  factory PartnerEntity.fromJson(Map<String,dynamic> json){
    return PartnerEntity(
      partnerId: json["partner_id"],
      name: json["name"],
      phoneNumber: json["phone_number"],
      description: json["description"],
      city: json['city'],
      avatar: json['avatar'],
      isUser: json['is_user'],
      isMerchant: json['is_merchant'],
      subscriptionId: json['subscription']
    );
  }

  Map<String,dynamic> toJson()=>{
    'partner_id':partnerId,
    'name':name,
    'phone_number':phoneNumber,
    'description':description,
    'city':city,
    'avatar':avatar,
    'is_user':isUser,
    'is_merchant':isMerchant,
    'subscriptionId':subscriptionId
  };
}