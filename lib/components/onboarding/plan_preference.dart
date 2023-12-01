import 'dart:developer';

import 'package:fitness_app/components/onboarding/preferences.dart';
import 'package:fitness_app/models/category.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/colors.dart';
import '../../utils/images.dart';
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
      illustration: AppImages.planSample1
    ),
    CategoryEntity(
      category_id: 2,
      description:"Perte de poids",
      illustration: AppImages.planSample2
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
                padding: EdgeInsets.only(left:15.0,),
                child: Text(
                  "Débuter un plan aujourd'hui",
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: planEntities.map(
                  (planItem) => GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                      margin: const EdgeInsets.all(5),
                      height: MediaQuery.of(context).size.height*0.2,
                      width: MediaQuery.of(context).size.width*0.4,
                      // height: 120,
                      // width: 350,
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
                          image: AssetImage(planItem.illustration!)
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(45.0),
                        child:Text(
                              planItem.description!
                        ),
                            
                      ),
                    ),
                    ),
                    onTap: () async{
                      objectif = planItem.category_id!;
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.setInt("goal", objectif);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context)=> const UserPreference()
                        )
                      );
                    },
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