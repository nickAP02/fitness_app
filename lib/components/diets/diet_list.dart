import 'package:fitness_app/components/diets/diet_card.dart';
import 'package:fitness_app/components/reusable/custom_appbar.dart';
import 'package:flutter/material.dart';

import '../../utils/images.dart';
import 'diet_details.dart';

class Diets extends StatefulWidget {
  const Diets({super.key});

  @override
  State<Diets> createState() => _DietsState();
}

class _DietsState extends State<Diets> {
  List<Diet> diets = [
    Diet(
      description: "Salade viet composée de gingembre, d'oignons, de ciboule, de comcombre et de tomates fraiches", 
      calory: 120, 
      category: "Maintien du corps", 
      image: AppImages.dietSample1
    ),
    Diet(
      description: "Salade viet composée de gingembre, d'oignons, de ciboule, de comcombre et de tomates fraiches", 
      calory: 120, 
      category: "Perte de poids", 
      image: AppImages.dietSample1
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Liste des diets", context),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: diets.length, 
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context)=> DietDetails(
                    description: diets[index].description,
                    calory: diets[index].calory,
                    category: diets[index].category,
                    image:  diets[index].image,
                  )
                ),
              );
            },
            child: Diet(
              description: diets[index].description, 
              calory: diets[index].calory, 
              category: diets[index].category, 
              image: diets[index].image
            ),
          );
        },
      ),
    );
  }
}