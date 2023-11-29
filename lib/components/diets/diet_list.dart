import 'package:fitness_app/components/diets/diet_card.dart';
import 'package:fitness_app/components/reusable/custom_appbar.dart';
import 'package:fitness_app/models/category.dart';
import 'package:flutter/material.dart';

import '../../models/diet.dart';
import '../../utils/images.dart';

class Diets extends StatefulWidget {
  const Diets({super.key});

  @override
  State<Diets> createState() => _DietsState();
}

class _DietsState extends State<Diets> {
  List<DietEntity> diets = [
    DietEntity(
      diet_id: 1,
      title: "Salade viet",
      description: "Salade viet composée de gingembre, d'oignons, de ciboule, de comcombre et de tomates fraiches", 
      plan_id: CategoryEntity(
        category_id: 1, 
        description: "Maintien du corps", 
        illustration: AppImages.planSample1
      ), 
      calory: 120, 
      illustration: AppImages.dietSample1
    ),
    DietEntity(
      diet_id: 2,
      title: "Salade viet",
      description: "Salade viet composée de gingembre, d'oignons, de ciboule, de comcombre et de tomates fraiches", 
      plan_id: CategoryEntity(
        category_id: 1, 
        description: "Maintien du corps", 
        illustration: AppImages.planSample1
      ), 
      calory: 120, 
      illustration: AppImages.dietSample1
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Liste des diets", context),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: diets.length, 
        itemBuilder: (context, index) {
          return Diet(
            description: diets[index].description!, 
            calory: diets[index].calory!, 
            category: diets[index].plan_id!.description!, 
            image: diets[index].illustration!,
          );
        },
      ),
    );
  }
}