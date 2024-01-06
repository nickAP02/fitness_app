//plan category with a goal in calory
//weight loss or fitness
class CategoryEntity {
  int? categoryId;
  String? description;
  String? illustration;

  CategoryEntity({
    required this.categoryId,
    required this.description,
    required this.illustration 
  });

  factory CategoryEntity.fromJson(Map<String,dynamic>json){
    return CategoryEntity(
      categoryId: json["category_id"],
      description: json['description'],
      illustration: json['illustration']
    );
  }
  Map<String,dynamic> toJson() =>{
    'category_id':categoryId,
    'description':description,
    'illustration':illustration
  };
}