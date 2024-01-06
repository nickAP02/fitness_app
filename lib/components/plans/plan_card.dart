import 'package:fitness_app/components/plans/plan_details.dart';
import 'package:fitness_app/models/category.dart';
import 'package:fitness_app/models/diet.dart';
import 'package:fitness_app/models/exercise.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';

// ignore: must_be_immutable
class Plan extends StatelessWidget {
  CategoryEntity plan;
  List<ExerciseEntity> exercices;
  List<DietEntity> diets;
  Plan({super.key, 
    required this.plan,
    required this.exercices,
    required this.diets
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context)=>PlanDetails(
              plan: plan,
              exercises: exercices,
              diets:diets,
            )
          )
        );
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        // height: MediaQuery.of(context).size.height*0.2,
        // width: MediaQuery.of(context).size.width*0.4,
        height: 120,
        width: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: AppColors.primaryColor
          ),
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5),
              BlendMode.darken,
            ),
            fit: BoxFit.cover,
            scale: 1,
            opacity: 1,
            image: AssetImage(plan.illustration!)
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(45.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                plan.description!
              ),
              const SizedBox(height: 20,),
              Text("${exercices.length} exercices"),
            ],
          ),
        ),
      ),
    );
  }
}