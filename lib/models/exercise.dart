import 'dart:convert';

import 'category.dart';

class ExerciseEntity {
  int? exercise_id;
  String? title;
  String? description;
  int? time;
  // int? plan_id;
  CategoryEntity? plan_id;
  String? illustration;

  ExerciseEntity({
    this.exercise_id,
    this.title,
    this.description,
    this.time,
    this.plan_id,
    this.illustration
  });

  List<ExerciseEntity> exerciseFromJson(String str)=> List<ExerciseEntity>.from(json.decode(str).map((x)=>ExerciseEntity.fromJson(x)));
  
  String exerciseToJson(List<ExerciseEntity> data) => json.encode(List<dynamic>.from(data.map((e) => e.toJson())));

  factory ExerciseEntity.fromJson(Map<String,dynamic>json){
    return ExerciseEntity(
      exercise_id: json["exercise_id"],
      title: json["title"],
      description: json["description"],
      time: json["time"],
      plan_id: CategoryEntity.fromJson(json["plan_id"]),
      illustration: json["illustration"]
    );
  }
  Map<String,dynamic> toJson()=>{
    'exercise_id':exercise_id,
    'title':title,
    'description':description,
    'time':time,
    'plan_id':plan_id,
    'illustration':illustration
  };
}