

class PartnerEntity {
  // ignore: non_constant_identifier_names
  int? partner_id;
  String? name;
  String? description;
  String? localisation;
  String? avatar;
  // ignore: non_constant_identifier_names
  bool? is_merchant;
  int? subscription_id;

  PartnerEntity({
    this.partner_id,
    this.name,
    this.description,
    this.localisation,
    this.avatar,
    this.is_merchant,
    this.subscription_id
  });

  factory PartnerEntity.fromJson(Map<String,dynamic>json){
    return PartnerEntity(
      partner_id: json["partner_id"],
      name: json["name"],
      description: json["description"],
      localisation: json["localisation"],
      avatar: json["avatar"],
      is_merchant: json["is_merchant"],
      subscription_id: json["subscription_id"],
    );
  }
  Map<String,dynamic> toJson()=>{
    'partner_id':partner_id,
    'name':name,
    'description':description,
    'localisation':localisation,
    'avatar':avatar,
    'is_merchant':is_merchant,
    'subscription_id':subscription_id,
  };
}