import 'dart:convert';

import 'package:fitness_app/components/diets/diet_card.dart';
import 'package:fitness_app/components/exercises/exercise_card.dart';
import 'package:fitness_app/components/reusable/bottom_navbar.dart';
import 'package:fitness_app/components/reusable/search_item.dart';
import 'package:fitness_app/models/diet.dart';
import 'package:fitness_app/models/exercise.dart';
import 'package:fitness_app/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/colors.dart';
import '../reusable/custom_appbar.dart';
import '../reusable/search_bar.dart';

class Search extends StatefulWidget {
  Search({
    super.key,
  
  });

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController controller = TextEditingController();
  int exercices_count=0;
  int diets_count=0;
  int gyms_count=0;
  List initialData = [];
  List initialExerciceData = [];
  List initialDietData = [];
  var resultsData = [];
  List<Widget> results = [];
  bool isSelected = true;
  List<SearchItem> filters = [];
  void getUserData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    gyms_count = prefs.getInt("partners")!;
    diets_count = prefs.getInt("diets")!;
    exercices_count = prefs.getInt("exercises")!;
    initialData = json.decode(prefs.getString("search_data")!);
    initialExerciceData = json.decode(json.encode(prefs.getString("exercice_list")));
    initialDietData = json.decode(json.encode(prefs.getString("diet_list")));
  }
  @override
  Widget build(BuildContext context) {
    print("initial data ${initialData.length}");
    print("initial exercice data ${initialExerciceData.length}");
    print("initial diet data ${initialDietData.length}");
    filters = [
      SearchItem(
        id:1, 
        title: 'Exercices',
        showItems: (){
          print("exercices");
        },
      ),
      SearchItem(
        id:2, 
        title: 'Nutrition',
        showItems: (){
          print("nutrition");
        },
      ),
      SearchItem(
        id: 3, 
        title: 'Astuces',
        showItems: (){
          print("astuces");
        },
      ),
    ];
    return Scaffold(
      appBar:buildAppBar("Recherche", context) ,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
            padding: const EdgeInsets.only(top:15.0,right: 35,left: 35),
            child: SizedBox(
              height: 40,
              width: MediaQuery.of(context).size.width,
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search,color: AppColors.secondaryColor,),
                  // prefixText: "Rechercher exercices, astuces, gyms",
                  prefixStyle:const TextStyle(
                    color: AppColors.secondaryColor,
                    overflow: TextOverflow.clip
                  ),
                  label:const Text(
                    "Rechercher...",
                    style: TextStyle(
                    color: AppColors.primaryTextColor,
                    overflow: TextOverflow.clip
                  ),
                    ),
                  // constraints:const BoxConstraints(
                  //   maxWidth: 20,
                  //   maxHeight: 20,
                  // ),
                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                      color: AppColors.primaryColor
                    ),
                  )
                ),
                controller: controller,
                style:const TextStyle(
                  color: AppColors.primaryColor
                ),
                onChanged: (search){
                  setState(() {
                    if(search.isEmpty){
                      resultsData = [];
                      print("result data empty $resultsData");
                    }
                    else{
                      List tableData = [];
                      print("controler $search");
                      print("list ${initialExerciceData.length}");
                      initialExerciceData.forEach((element) {
                        if(element.title!.contains(search)&&element.description!.contains(search)){
                          results.add(
                            Exercice(
                              exercise: element,
                            )
                          );
                          print("results ${results.length}");
                        }
                      });
                      initialDietData.forEach((element) {
                      print("list ${initialDietData.length}");
                        if(element.title!.contains(search)&&element.description!.contains(search)){
                          results.add(
                            Diet(data: element)
                          );
                        }
                        print("results ${results.length}");
                      });
                    }
                    // print("results length ${results.length}");
                  });
                },
              ),
            ),
          ),
            Padding(
              padding: const EdgeInsets.only(top:10.0,left: 25),
              child: Row(
                // crossAxisCount: 2,
                // scrollDirection: Axis.horizontal,
                // shrinkWrap: false,
                //contenu basé sur le filtre choisi
                children: filters,
              ),
            ),
          // const Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Padding(
          //       padding: EdgeInsets.only(top:8.0,left: 15),
          //       child: Text(
          //         "Exercices(2)",
          //         style: TextStyle(
          //           color: AppColors.primaryColor,
          //           fontSize: 15,
          //         ),
          //       ),
          //     ),
          //     Padding(
          //       padding: EdgeInsets.all(15.0),
          //       child: Text(
          //         "Voir tout",
          //         style: TextStyle(
          //             color: AppColors.primaryColor,
          //             fontSize: 8,
          //           ),
          //       ),
          //     ),
          //   ],
          // ),
            resultsData.isEmpty?
            Center(
              child: Text("Pas de résultats"),
            ):
            ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              padding: const EdgeInsets.only(left: 10,right: 15,top: 10),
              children: 
              // [
              //   Text("Fatigué")
              // ]
              results.toList(),
            ),
          //   const Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Padding(
          //       padding: EdgeInsets.only(top:8.0,left: 15),
          //       child: Text(
          //         "Nutrition(2)",
          //         style: TextStyle(
          //           color: AppColors.primaryColor,
          //           fontSize: 15,
          //         ),
          //       ),
          //     ),
          //     Padding(
          //       padding: EdgeInsets.all(15.0),
          //       child: Text(
          //         "Voir tout",
          //         style: TextStyle(
          //             color: AppColors.primaryColor,
          //             fontSize: 8,
          //           ),
          //       ),
          //     ),
          //   ],
          // ),
          // GridView.count(
          //     crossAxisCount: 2,
          //     scrollDirection: Axis.vertical,
          //     shrinkWrap: true,
          //     padding: const EdgeInsets.only(left: 10,right: 15,top: 10),
          //     children: [
          //       Diet(
          //         description: "Salade viet", 
          //         calory: 120, 
          //         category: "Maintien du corps", 
          //         image: AppImages.dietSample1
          //       ),
          //       Diet(
          //         description: "Salade viet", 
          //         calory: 120, 
          //         category: "Maintien du corps", 
          //         image: AppImages.dietSample1
          //       ),
          //     ],
          //   ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
  showItems(result){
    result = [];
    return ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      padding: const EdgeInsets.only(left: 10,right: 15,top: 10),
      children: 
      // [
      //   Text("Fatigué")
      // ]
      result.toList(),
    );
  }
}

