import 'dart:developer';
import 'package:fitness_app/components/diets/diet_card.dart';
import 'package:fitness_app/components/exercises/exercise_card.dart';
import 'package:fitness_app/components/exercises/exercise_detail.dart';
import 'package:fitness_app/components/exercises/plan_card.dart';
import 'package:fitness_app/components/reusable/bottom_navbar.dart';
import 'package:fitness_app/utils/constant.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Wrap(
          children: [
            Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const ListTile(
                  leading: Icon(
                      Icons.bolt,
                      color: Colors.white,
                  ),
                  title: Text(
                    "Objectif actuel",
                    style: TextStyle(
                      color: primaryColor
                    ),
                  ),
                ),
                Plan(
                  title: 'Maintien du corps',
                  image: 'plan-1.jpg',
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top:8.0,left: 15),
                      child: Text(
                        "Exercices",
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        log("liste des exercices");
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          "Voir tout",
                          style: TextStyle(
                              color: primaryColor,
                              fontSize: 8,
                            ),
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
                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context)=> ExerciseDetail(
                                description: "Sprint rapide",
                                time: 5,
                                category: "Maintien du corps",
                                image: "exercice-1.jpg",
                              )
                            ),
                          );
                        },
                        child: Exercice(
                          description: "Sprint rapide", 
                          time: 5, 
                          category: "Maintien du corps", 
                          image: "exercice-1.jpg"
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context)=> ExerciseDetail(
                                description: "Sprint rapide",
                                time: 5,
                                category: "Maintien du corps",
                                image: "exercice-1.jpg",
                              )
                            ),
                          );
                        },
                        child: Exercice(
                          description: "Sprint rapide", 
                          time: 10, 
                          category: "Maintien du corps", 
                          image: "exercice-2.jpg"
                        ),
                      ),
                    ],
                  ),
                ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10,right: 5,top: 10),
                      child: Text(
                        "Plans",
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        log("liste des plans");
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          "Voir tout",
                          style: TextStyle(
                              color: primaryColor,
                              fontSize: 8,
                            ),
                        ),
                      ),
                    ),
                  ],
                ),
                Plan(
                  title: 'PERTE DE POIDS',
                  image: 'plan-2.jpg',
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top:8.0,left: 15),
                      child: Text(
                        "Nutrition",
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        log("liste des diets");
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          "Voir tout",
                          style: TextStyle(
                              color: primaryColor,
                              fontSize: 8,
                            ),
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
                        image: "diet-1.jpg"
                      ),
                      Diet(
                        description: "Salade viet", 
                        calory: 120, 
                        category: "Maintien du corps", 
                        image: "diet-1.jpg"
                      ),
                    ],
                  ),
              ],
            ),
          ),
          ], 
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

