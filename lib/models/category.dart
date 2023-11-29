//plan category with a goal in calory
//weight loss or fitness
class CategoryEntity {
  int? category_id;
  String? description;
  String? illustration;

  CategoryEntity({
    required this.category_id,
    required this.description,
    required this.illustration 
  });

  factory CategoryEntity.fromJson(Map<String,dynamic>json){
    return CategoryEntity(
      category_id: json["category_id"],
      description: json['description'],
      illustration: json['illustration']
    );
  }
  Map<String,dynamic> toJson() =>{
    'category_id':category_id,
    'description':description,
    'illustration':illustration
  };
}