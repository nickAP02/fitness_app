import 'package:fitness_app/components/diets/diet_card.dart';
import 'package:fitness_app/components/exercises/exercise_card.dart';
import 'package:fitness_app/components/reusable/bottom_navbar.dart';
import 'package:fitness_app/components/reusable/search_item.dart';
import 'package:fitness_app/utils/images.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../reusable/custom_appbar.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                      "Rechercher exercices, astuces, gyms",
                      style: TextStyle(
                      color: AppColors.secondaryColor,
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
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top:10.0,left: 25),
              child: Row(
                // crossAxisCount: 2,
                // scrollDirection: Axis.horizontal,
                // shrinkWrap: false,
                children: [
                  SearchItem(
                    // isSelected: true, 
                    title: 'Pour toi',
                  ),
                  SearchItem(
                    // isSelected: true, 
                    title: 'Exercices',
                  ),
                  SearchItem(
                    // isSelected: true, 
                    title: 'Nutrition',
                  ),
                  SearchItem(
                    // isSelected: true, 
                    title: 'Astuces',
                  ),
                ],
              ),
            ),
            const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(top:8.0,left: 15),
                child: Text(
                  "Exercices(2)",
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 15,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  "Voir tout",
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 8,
                    ),
                ),
              ),
            ],
          ),
            SingleChildScrollView(
              child: GridView.count(
                crossAxisCount: 2,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                padding: const EdgeInsets.only(left: 10,right: 15,top: 10),
                children: [
                  Exercice(
                    description: "Sprint rapide", 
                    time: 5, 
                    category: "Maintien du corps", 
                    image: AppImages.exerciceSample1
                  ),
                  Exercice(
                    description: "Sprint rapide", 
                    time: 10, 
                    category: "Maintien du corps", 
                    image: AppImages.exerciceSample2
                  ),
                ],
              ),
            ),
            const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(top:8.0,left: 15),
                child: Text(
                  "Nutrition(2)",
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 15,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  "Voir tout",
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 8,
                    ),
                ),
              ),
            ],
          ),
          GridView.count(
              crossAxisCount: 2,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              padding: const EdgeInsets.only(left: 10,right: 15,top: 10),
              children: [
                Diet(
                  description: "Salade viet", 
                  calory: 120, 
                  category: "Maintien du corps", 
                  image: AppImages.dietSample1
                ),
                Diet(
                  description: "Salade viet", 
                  calory: 120, 
                  category: "Maintien du corps", 
                  image: AppImages.dietSample1
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

