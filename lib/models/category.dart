//plan category with a goal in calory
//weight loss or fitness
class Category {
  late String? description;
  late String? goal;

  Category({
    this.description,
    this.goal 
  });

  factory Category.fromJson(Map<String,dynamic>json){
    return Category(
      description: json['description'],
      goal: json['goal']
    );
  }
  Map<String,dynamic> toJson() =>{
    'description':description,
    'goal':goal
  };
}