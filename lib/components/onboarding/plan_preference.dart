
import 'package:fitness_app/components/onboarding/preferences.dart';
import 'package:fitness_app/models/category.dart';
import 'package:fitness_app/utils/constant.dart';
import 'package:flutter/material.dart';
import '../../service/local_storage.dart';

import '../../utils/colors.dart';
import '../../utils/images.dart';

class PlanPreferences extends StatefulWidget {
  const PlanPreferences({super.key});

  @override
  State<PlanPreferences> createState() => _PlanPreferencesState();
}

class _PlanPreferencesState extends State<PlanPreferences> {
  int objectif=0;
  var planEntities = [
    CategoryEntity(
      categoryId: 1,
      description:"Maintien du corps",
      illustration: AppImages.planSample1
    ),
    CategoryEntity(
      categoryId: 2,
      description:"Perte de poids",
      illustration: AppImages.planSample2
    ),
  ];
  var borderColor = AppColors.primaryColor;
  int borderWidth = 2;
  final LocalStorage storage = LocalStorage();
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
                padding: EdgeInsets.only(left:AppConstants.padding_15,),
                child: Text(
                  "Débuter un plan aujourd'hui",
                  style: TextStyle(
                    fontSize: AppConstants.fontSize_40,
                    color: Colors.white
                  ),
                ),
              ),
              const SizedBox(
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
                          color: borderColor,
                          width: borderWidth.toDouble(),
                          style: BorderStyle.solid
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
                        padding: const EdgeInsets.all(AppConstants.padding_45),
                        child:Text(
                              planItem.description!
                        ),
                            
                      ),
                    ),
                    ),
                    onTap: (){
                        borderWidth = 4;
                        borderColor = AppColors.primaryTextColor;
                        objectif = planItem.categoryId!;
                        storage.saveGoal(objectif);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context)=>  const UserPreference()
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