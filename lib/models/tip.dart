class TipEntity {
  int? tip_id;
  String? title;
  String? description;
  int? plan_id;

  TipEntity({
    this.tip_id,
    this.title,
    this.description,
    this.plan_id
  });

  factory TipEntity.fromJson(Map<String,dynamic> json){
    return TipEntity(
      tip_id: json["tip_id"],
      title: json["title"],
      description: json["description"],
      plan_id: json["plan_id"]
    );
  }

  Map<String,dynamic> toJson() =>{
    'tip_id':tip_id,
    'title':title,
    'description':description,
    'plan_id':plan_id
  };
}