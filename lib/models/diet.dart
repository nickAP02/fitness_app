import 'package:fitness_app/models/category.dart';

class DietEntity {
  int? diet_id;
  String? title;
  String? description;
  CategoryEntity? plan_id;
  double? calory;
  String? illustration;

  DietEntity({
    this.diet_id,
    this.title,
    this.description,
    this.plan_id,
    this.calory,
    this.illustration
  });

  factory DietEntity.fromJson(Map<String,dynamic>json){
    return DietEntity(
      diet_id: json["diet_id"],
      title: json["title"],
      description: json["description"],
      plan_id: CategoryEntity.fromJson(json["plan_id"]),
      calory: json["calory"],
      illustration: json["illustration"],
    );
  }

  Map<String, dynamic> toJson() =>{
    'diet_id':diet_id,
    'title':title,
    'description':description,
    'plan_id':plan_id,
    'calory':calory,
    'illustration':illustration
  };

}