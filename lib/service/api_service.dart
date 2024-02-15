import 'dart:core';


class ApiService{
  List data = [];
  Future<List<dynamic>> fetchData() async{
    // final url = Uri.parse("/api/recipes/v2?type=public&random=true&beta=true&field%5B0%5D=uri&co2EmissionsClass=A%2B");
    // final response = await http.get(
    //   url,
    //   headers:{
    //     'Accept-Language':'en',
    //     'X-Rapidapi-Key':'cf1ea39138mshc353349ce6bf37ap17b016jsn3feb2a4bd70a',
    //     'X-Rapidapi-Host':'edamam-recipe-search.p.rapidapi.com'
    //   }
    // );
    // print("response ${response.body}");
    // data.add(response);
    return data;
  }
  Future<dynamic> create(int id) async{

  }
  Future<dynamic> getDataById(int id) async{

  }
  Future<dynamic> update(int id) async{

  }
  Future<dynamic> delete(int id) async{

  }

  // Future<List<ExerciseEntity>> fetchExercises() async{
  //   final url = Uri.parse("/v1/exercises");
  //   final response = await http.get(
  //     url,
  //     headers:{
  //       'X-Rapidapi-Key':'cf1ea39138mshc353349ce6bf37ap17b016jsn3feb2a4bd70a',
  //       'X-Rapidapi-Host':'exercise-by-api-ninjas.p.rapidapi.com'
  //     }
  //   );
  //   print("response ${response.body}");
  //   return exercises;
  // }
}