import 'package:fitness_app/components/reusable/custom_appbar.dart';
import 'package:flutter/material.dart';

import '../../utils/images.dart';
import 'exercise_card.dart';
import 'exercise_detail.dart';

class Exercices extends StatefulWidget {
  const Exercices({super.key});

  @override
  State<Exercices> createState() => _ExercicesState();
}

class _ExercicesState extends State<Exercices> {
  List<Exercice> exercices = [
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
      image: AppImages.exerciceSample1
    ),
    Exercice(
      description: "Pompes", 
      time: 3, 
      category: "Maintien du corps", 
      image: AppImages.exerciceSample1
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Liste des exercies", context),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: exercices.length,
        itemBuilder: (context, index) {
         return GestureDetector(
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context)=> ExerciseDetail(
                    description: exercices[index].description,
                    time: exercices[index].time,
                    category: exercices[index].category,
                    image: exercices[index].image,
                  )
                ),
              );
            },
            child: Exercice(
              description: exercices[index].description, 
              time: exercices[index].time, 
              category: exercices[index].category, 
              image: exercices[index].image
            ),
          );
        },
        // crossAxisCount: 2,
        // children: [
        //   GestureDetector(
        //     onTap: (){
        //       Navigator.of(context).push(
        //         MaterialPageRoute(
        //           builder: (context)=> ExerciseDetail(
        //             description: "Sprint rapide",
        //             time: 10,
        //             category: "Maintien du corps",
        //             image:  AppImages.exerciceSample1,
        //           )
        //         ),
        //       );
        //     },
        //     child: Exercice(
        //       description: "Sprint rapide", 
        //       time: 10, 
        //       category: "Maintien du corps", 
        //       image: AppImages.exerciceSample1
        //     ),
        //   ),
        //   GestureDetector(
        //     onTap: (){
        //       Navigator.of(context).push(
        //         MaterialPageRoute(
        //           builder: (context)=> ExerciseDetail(
        //             description: "Pompes",
        //             time: 3,
        //             category: "Maintien du corps",
        //             image:  AppImages.exerciceSample1,
        //           )
        //         ),
        //       );
        //     },
        //     child: Exercice(
        //       description: "Pompes", 
        //       time: 3, 
        //       category: "Maintien du corps", 
        //       image: AppImages.exerciceSample1
        //     ),
        //   ),
        // ],
      ),
    );
  }
}