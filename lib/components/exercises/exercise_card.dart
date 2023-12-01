
import 'package:fitness_app/components/exercises/exercise_details.dart';
import 'package:flutter/material.dart';

import '../../models/exercise.dart';
import '../../utils/colors.dart';

// ignore: must_be_immutable
class Exercice extends StatelessWidget {
  ExerciseEntity exercise;
  Exercice({super.key, 
    required this.exercise
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context)=> ExerciseDetail(
              title: exercise.title!,
              description: exercise.description!,
              time: exercise.time,
              category: exercise.plan_id!.description!,
              image: exercise.illustration!,
            )
          ),
        );
      },
      child: Container(
          height: MediaQuery.of(context).size.height*0.2,
          width: MediaQuery.of(context).size.width*0.4,
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: AppColors.primaryTextColor,
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
            image: AssetImage(exercise.illustration!)
          ),
          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom:65.0,left: 80),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.primaryColor,
                    ),
                    height: 20,
                    width: 60,
                    child: Center(
                      child: Text(
                        exercise.plan_id!.description!,
                        style: const TextStyle(
                          // backgroundColor: primaryColor,
                          fontSize: 6,
                          color: Colors.white
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right:58.0),
                  child: Text(
                    exercise.description!,
                    style: const TextStyle(
                      fontSize: 10,
                      color: AppColors.primaryColor
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 90.0,top: 5),
                  child: Text(
                    '${exercise.time} min',
                    style: const TextStyle(
                      fontSize: 10,
                      color: AppColors.primaryColor
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}