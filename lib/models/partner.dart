

class PartnerEntity {
  // ignore: non_constant_identifier_names
  int? partnerId;
  String? name;
  String? description;
  String? localisation;
  String? avatar;
  // ignore: non_constant_identifier_names
  bool? isMerchant;
  int? subscriptionId;

  PartnerEntity({
    this.partnerId,
    this.name,
    this.description,
    this.localisation,
    this.avatar,
    this.isMerchant,
    this.subscriptionId
  });

  factory PartnerEntity.fromJson(Map<String,dynamic>json){
    return PartnerEntity(
      partnerId: json["partner_id"],
      name: json["name"],
      description: json["description"],
      localisation: json["localisation"],
      avatar: json["avatar"],
      isMerchant: json["is_merchant"],
      subscriptionId: json["subscription_id"],
    );
  }
  Map<String,dynamic> toJson()=>{
    'partner_id':partnerId,
    'name':name,
    'description':description,
    'localisation':localisation,
    'avatar':avatar,
    'is_merchant':isMerchant,
    'subscription_id':subscriptionId,
  };
}