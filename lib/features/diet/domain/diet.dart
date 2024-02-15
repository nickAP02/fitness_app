import 'package:fitness_app/models/category.dart';

class DietEntity {
  int? dietId;
  String? title;
  String? description;
  CategoryEntity? planId;
  double? calory;
  String? illustration;

  DietEntity({
    this.dietId,
    this.title,
    this.description,
    this.planId,
    this.calory,
    this.illustration
  });

  factory DietEntity.fromJson(Map<String,dynamic>json){
    return DietEntity(
      dietId: json["diet_id"],
      title: json["title"],
      description: json["description"],
      planId: CategoryEntity.fromJson(json["plan_id"]),
      calory: json["calory"],
      illustration: json["illustration"],
    );
  }

  Map<String, dynamic> toJson() =>{
    'diet_id':dietId,
    'title':title,
    'description':description,
    'plan_id':planId,
    'calory':calory,
    'illustration':illustration
  };

}