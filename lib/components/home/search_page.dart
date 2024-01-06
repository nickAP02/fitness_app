import 'dart:convert';
import 'package:fitness_app/components/reusable/search_item.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';

class Search extends StatefulWidget {
  const Search({
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
  List<Widget> results = [];
  bool isSelected = true;
  List<SearchItem> filters = [];
  void getUserData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    gyms_count = prefs.getInt("partners")!;
    diets_count = prefs.getInt("diets")!;
    exercices_count = prefs.getInt("exercises")!;
    initialData = json.decode(prefs.getString("search_data")!);
  }
  @override
  Widget build(BuildContext context) {
    print("initial data ${initialData.length}");
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
      body: Container(
        height: 200,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              BackButton(
                onPressed: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Home())
                  );
                },
              ),
              initialData.isEmpty?
              const Center(
                child: Text("Pas de résultats"),
              ):
              showItems(initialData),
            //   const Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
                Padding(
                  padding: EdgeInsets.only(top:8.0,left: 15),
                  child: Text(
                    "Nutrition(2)",
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: 15,
                    ),
                  ),
                ),
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
            ]
        ),
      ),
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

