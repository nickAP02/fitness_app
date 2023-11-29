class SubscriptionEntity {
  int? subscription_id;
  String? name;
  double? price;
  int? duration;

  SubscriptionEntity({
    this.subscription_id,
    this.name,
    this.price,
    this.duration
  });

  factory SubscriptionEntity.fromJson(Map<String,dynamic>json){
    return SubscriptionEntity(
      subscription_id: json["subscription_id"],
      name: json["name"],
      price: json["price"],
      duration: json["duration"]
    );
  }
  Map<String,dynamic> toJson()=>{
    'subscription_id':subscription_id,
    'name':name,
    'price':price,
    'duration':duration
  };

}