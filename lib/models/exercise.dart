import 'dart:convert';

class Exercise {
  late String? description;
  late Duration? time;
  late String? category;
  late String? image;

  Exercise({
    this.description,
    this.time,
    this.category,
    this.image
  });

  List<Exercise> exerciseFromJson(String str)=> List<Exercise>.from(json.decode(str).map((x)=>Exercise.fromJson(x)));
  
  String exerciseToJson(List<Exercise> data) => json.encode(List<dynamic>.from(data.map((e) => e.toJson())));

  factory Exercise.fromJson(Map<String,dynamic>json){
    return Exercise(
      description: json["desc"]??"",
      time: json["time"]??"",
      category: json["category"]??"",
      image: json["image"]??""
    );
  }
  Map<String,dynamic> toJson()=>{
    'description':description,
    'time':time,
    'category':category,
    'image':image
  };
}