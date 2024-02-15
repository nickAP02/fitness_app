import 'package:fitness_app/models/category.dart';
import 'package:fitness_app/features/exercise/domain/exercise.dart';
import 'package:flutter/material.dart';

import '../diet/domain/diet.dart';
import '../diet/diet_card.dart';
import '../exercise/presentation/exercise_card.dart';
import '../../components/reusable/custom_appbar.dart';
import '../../components/reusable/header.dart';

// ignore: must_be_immutable
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
      for (var diet in widget.diets) {
        if(widget.plan.categoryId==diet.planId!.categoryId){
          dietWidgets.add(
            Diet(
              data: diet,
            )
          );
        }
      }
      for (var exercise in widget.exercises) {
        if(widget.plan.categoryId==exercise.planId!.categoryId!){
          exerciseWidgets.add(
            Exercice(
              exercise: exercise,
            )
          );
        }
      }
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