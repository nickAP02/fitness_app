import 'dart:convert';

import 'category.dart';

class ExerciseEntity {
  int? exerciseId;
  String? title;
  String? description;
  int? time;
  // int? plan_id;
  CategoryEntity? planId;
  String? illustration;

  ExerciseEntity({
    this.exerciseId,
    this.title,
    this.description,
    this.time,
    this.planId,
    this.illustration
  });

  List<ExerciseEntity> exerciseFromJson(String str)=> List<ExerciseEntity>.from(json.decode(str).map((x)=>ExerciseEntity.fromJson(x)));
  
  String exerciseToJson(List<ExerciseEntity> data) => json.encode(List<dynamic>.from(data.map((e) => e.toJson())));

  factory ExerciseEntity.fromJson(Map<String,dynamic>json){
    return ExerciseEntity(
      exerciseId: json["exercise_id"],
      title: json["title"],
      description: json["description"],
      time: json["time"],
      planId: CategoryEntity.fromJson(json["plan_id"]),
      illustration: json["illustration"]
    );
  }
  Map<String,dynamic> toJson()=>{
    'exercise_id':exerciseId,
    'title':title,
    'description':description,
    'time':time,
    'plan_id':planId,
    'illustration':illustration
  };
}