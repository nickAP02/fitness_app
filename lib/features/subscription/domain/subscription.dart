class SubscriptionEntity {
  int? subscriptionId;
  String? name;
  double? price;
  int? duration;

  SubscriptionEntity({
    this.subscriptionId,
    this.name,
    this.price,
    this.duration
  });

  factory SubscriptionEntity.fromJson(Map<String,dynamic>json){
    return SubscriptionEntity(
      subscriptionId: json["subscription_id"],
      name: json["name"],
      price: json["price"],
      duration: json["duration"]
    );
  }
  Map<String,dynamic> toJson()=>{
    'subscription_id':subscriptionId,
    'name':name,
    'price':price,
    'duration':duration
  };

}