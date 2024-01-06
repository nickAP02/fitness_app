import 'package:fitness_app/components/reusable/custom_appbar.dart';
import 'package:fitness_app/models/exercise.dart';
import 'package:flutter/material.dart';

import 'exercise_card.dart';
import 'exercise_details.dart';

// ignore: must_be_immutable
class Exercices extends StatefulWidget {
  List<ExerciseEntity> data;
  Exercices({
    super.key,
    required this.data
  });

  @override
  State<Exercices> createState() => _ExercicesState();
}

class _ExercicesState extends State<Exercices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Liste des exercies", context),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: widget.data.length,
        itemBuilder: (context, index) {
         return GestureDetector(
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context)=> ExerciseDetail(
                    title: widget.data[index].title!,
                    description: widget.data[index].description!,
                    time: widget.data[index].time,
                    category: widget.data[index].planId!.description!,
                    image: widget.data[index].illustration!,
                  )
                ),
              );
            },
            child: Exercice(
              exercise: widget.data[index],
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