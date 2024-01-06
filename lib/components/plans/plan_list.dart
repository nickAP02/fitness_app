import 'package:fitness_app/components/plans/plan_card.dart';
import 'package:fitness_app/utils/constant.dart';
import 'package:flutter/material.dart';

import '../../models/category.dart';

class Plans extends StatelessWidget {
  List<CategoryEntity> data;
  Plans({
      super.key,
      required this.data
    });

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
                padding: EdgeInsets.only(
                  left:AppConstants.padding_15,
                  top: AppConstants.padding_40,
                  bottom: AppConstants.padding_20),
                child: Text(
                  "Débuter un plan aujourd'hui",
                  style: TextStyle(
                    fontSize: AppConstants.fontSize_40,
                    color: Colors.white
                  ),
                ),
              ),
              Column(
                children: data.map((e) => Plan(
                  plan: e, 
                  exercices: [], 
                  diets: [],
                  )
                ).toList(),
              )      
            ],
          ),
        ),
      ),
    );
  }
}