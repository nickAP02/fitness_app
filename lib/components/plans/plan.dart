import 'package:fitness_app/components/exercises/plan_card.dart';
import 'package:flutter/material.dart';

class Plans extends StatelessWidget {
  const Plans({super.key});

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
                children: [
                  Plan(
                    title: 'Maintien du corps',
                    image: 'plan-1.jpg',
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:20.0),
                    child: Plan(
                      title: 'Perte de poids',
                      image: 'plan-2.jpg',
                    )
                  ),
                ],
              )      
            ],
          ),
        ),
      ),
    );
  }
}