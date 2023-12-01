import 'package:fitness_app/models/category.dart';
import 'package:fitness_app/models/exercise.dart';
import 'package:flutter/material.dart';

import '../../models/diet.dart';
import '../diets/diet_card.dart';
import '../exercises/exercise_card.dart';
import '../reusable/custom_appbar.dart';
import '../reusable/header.dart';

class PlanDetails extends StatefulWidget {
  CategoryEntity plan;
  List<ExerciseEntity> exercises;
  List<DietEntity> diets;
  PlanDetails({
    super.key,
    required this.plan,
    required this.exercises,
    required this.diets
    });

  @override
  State<PlanDetails> createState() => _PlanDetailsState();
}

class _PlanDetailsState extends State<PlanDetails> {
  List<Exercice> exerciseWidgets = [];
  List<Diet> dietWidgets = [];
  @override
  void initState() {
    void getPlanData(){
      widget.diets.forEach((diet) {
        if(widget.plan.category_id==diet.plan_id!.category_id){
          dietWidgets.add(
            Diet(
              data: diet,
            )
          );
        }
      });
      widget.exercises.forEach((exercise) {
        if(widget.plan.category_id==exercise.plan_id!.category_id!){
          exerciseWidgets.add(
            Exercice(
              exercise: exercise,
            )
          );
        }
      });
    }
    // TODO: implement initState
    super.initState();
    getPlanData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:buildAppBar(widget.plan.description!, context),
        body: CustomScrollView(
          scrollBehavior: const MaterialScrollBehavior(),
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              sliver: SliverToBoxAdapter(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(widget.plan.illustration!),
                  Header(
                    text: "Exercises associés",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.2,
                    width: MediaQuery.of(context).size.width,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: exerciseWidgets.toList(),
                    ),
                  ),
                  Header(
                    text: "Nutrition associée",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.2,
                    width: MediaQuery.of(context).size.width,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: dietWidgets.toList(),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // Header(
                  //   text: "Astuces associés",
                  // ),
                  // SingleChildScrollView(
                  //   child: GridView.count(
                  //     crossAxisCount: 2,
                  //     scrollDirection: Axis.horizontal,
                  //     children: dietWidgets.toList(),
                  //   ),
                  // )
                ],
              )),
            ),
          ],
        ),
    );
  }
}