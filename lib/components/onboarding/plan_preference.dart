import 'dart:developer';

import 'package:fitness_app/components/onboarding/preferences.dart';
import 'package:fitness_app/models/category.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../plans/plan_card.dart';

class PlanPreferences extends StatefulWidget {
  const PlanPreferences({super.key});

  @override
  State<PlanPreferences> createState() => _PlanPreferencesState();
}

class _PlanPreferencesState extends State<PlanPreferences> {
  int objectif=0;
  var planEntities = [
    CategoryEntity(
      category_id: 1,
      description:"Maintien du corps",
      illustration: "plan-1.jpg"
    ),
    CategoryEntity(
      category_id: 2,
      description:"Perte de poids",
      illustration: "plan-2.jpg"
    ),
    CategoryEntity(
      category_id: 3,
      description:"Musculation",
      illustration: "plan-1.jpg"
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(left:15.0,top: 40,bottom: 20),
                child: Text(
                  "Débuter un plan aujourd'hui",
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white
                  ),
                ),
              ),
              Column(
                children: planEntities.map(
                  (planItem) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Plan(
                      title: planItem.description!,
                      image: planItem.illustration!,
                      callback: () async{
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        prefs.setInt("goal", planItem.category_id!);
                        log("goal ${prefs.getInt("goal")}");
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context)=> const UserPreference()
                          )
                        );
                      },
                    ),
                  )
                ).toList()
              )     
            ],
          ),
        ),
      ),
    );
  }
}