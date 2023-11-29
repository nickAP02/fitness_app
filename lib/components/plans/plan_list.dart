import 'package:fitness_app/components/plans/plan_card.dart';
import 'package:flutter/material.dart';

import '../../models/category.dart';

class Plans extends StatelessWidget {
  const Plans({super.key});

  @override
  Widget build(BuildContext context) {
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
                children: planEntities.map((e) => Plan(
                  title: e.description!, 
                  image: e.illustration!, 
                  callback: (){
                    
                  })).toList(),
              )      
            ],
          ),
        ),
      ),
    );
  }
}