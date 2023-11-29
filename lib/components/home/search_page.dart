import 'package:fitness_app/components/exercises/exercise_card.dart';
import 'package:fitness_app/components/reusable/bottom_navbar.dart';
import 'package:fitness_app/components/reusable/search_item.dart';
import 'package:fitness_app/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/colors.dart';
import '../reusable/custom_appbar.dart';
import '../reusable/search_bar.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController controller = TextEditingController();
  int exercices_count=0;
  int diets_count=0;
  int gyms_count=0;
  var results = [];
  void getUserData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    gyms_count = prefs.getInt("partners")!;
    diets_count = prefs.getInt("diets")!;
    exercices_count = prefs.getInt("exercises")!;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:buildAppBar("Recherche", context) ,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            makeSearchOption(context,
            (){
              setState(() {
                
              });
            },
            (){
              setState(() {
                
              });
            }),
            Padding(
              padding: const EdgeInsets.only(top:10.0,left: 25),
              child: Row(
                // crossAxisCount: 2,
                // scrollDirection: Axis.horizontal,
                // shrinkWrap: false,
                children: [
                  //contenu basé sur le plan choisi
                  SearchItem(
                    isSelected: true, 
                    title: 'Pour toi',
                  ),
                  SearchItem(
                    isSelected: true, 
                    title: 'Exercices',
                  ),
                  SearchItem(
                    isSelected: true, 
                    title: 'Nutrition',
                  ),
                  SearchItem(
                    isSelected: true, 
                    title: 'Astuces',
                  ),
                ],
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
            SingleChildScrollView(
              child: GridView.count(
                crossAxisCount: 2,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                padding: const EdgeInsets.only(left: 10,right: 15,top: 10),
                children: [
                  Text("Fatigué")
                ]
                // results.toList() as List<Widget>,
              ),
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

  }

