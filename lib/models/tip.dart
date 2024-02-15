class TipEntity {
  int? tipId;
  String? title;
  String? description;
  int? planId;

  TipEntity({
    this.tipId,
    this.title,
    this.description,
    this.planId
  });

  factory TipEntity.fromJson(Map<String,dynamic> json){
    return TipEntity(
      tipId: json["tip_id"],
      title: json["title"],
      description: json["description"],
      planId: json["plan_id"]
    );
  }

  Map<String,dynamic> toJson() =>{
    'tip_id':tipId,
    'title':title,
    'description':description,
    'plan_id':planId
  };
}