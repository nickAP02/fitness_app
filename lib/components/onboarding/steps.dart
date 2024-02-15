import 'package:fitness_app/components/onboarding/preferences.dart';
import 'package:fitness_app/utils/constant.dart';
import 'package:flutter/material.dart';

class OnboardingSteps extends StatefulWidget {
  const OnboardingSteps({super.key});

  @override
  State<OnboardingSteps> createState() => _OnboardingStepsState();
}

class _OnboardingStepsState extends State<OnboardingSteps> {

  @override
  Widget build(BuildContext context) {
    int index=0;
    bool isSelected=false;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Stepper(
              controlsBuilder: (context, details) {
                return Row(
                  children: <Widget>[
                    TextButton(
                      onPressed: details.onStepContinue,
                      child: const Text('Continuer'),
                    ),
                    TextButton(
                      onPressed: details.onStepCancel,
                      child: const Text('Retourner'),
                    ),
                  ],
                );
              },
              onStepTapped: (value) {
                setState(() {
                  index = value;
                });
              },
              currentStep: index,
              type: StepperType.vertical,
              onStepContinue: (){
                setState(() {
                  index++;
                });
              },
              onStepCancel: (){
                setState(() {
                  index--;
                });
              },
              steps: [
                  Step(
                    title: const Text(
                      "Objectifs🎯🥇",
                      style: TextStyle(
                        fontSize: AppConstants.padding_20,
                        color: Colors.white
                      ),
                    ), 
                    content: const Text(
                        "Définissez des objectifs qui vous ressemblent",
                        style: TextStyle(
                          fontSize: AppConstants.padding_20,
                          color: Colors.white
                        ),
                      ),
                    state: StepState.indexed,
                    isActive: isSelected
                    ),
                    Step(
                      title:const Text(
                        "Exercices🏋🏾‍♂️",
                        style: TextStyle(
                          fontSize: AppConstants.padding_20,
                          color: Colors.white
                        ),
                      ),
                      content: const Text(
                        "Trouvez des exercices adaptés",
                        style: TextStyle(
                          fontSize: AppConstants.padding_20,
                          color: Colors.white
                        ),
                      ),
                      state: StepState.indexed,
                      isActive: isSelected
                    ),
                    Step(
                      title:const Text(
                        "Nutrition🥗🍉",
                        style: TextStyle(
                          fontSize: AppConstants.padding_20,
                          color: Colors.white
                        ),
                      ),
                      content: const Text(
                        "Des conseils pour une bonne alimentation",
                        style: TextStyle(
                          fontSize: AppConstants.padding_20,
                          color: Colors.white
                        ),
                      ),
                      state: StepState.indexed,
                      isActive: isSelected
                    ),
                    Step(
                        title:const Text(
                          "Croissance📈",
                          style: TextStyle(
                            fontSize: AppConstants.fontSize_20,
                            color: Colors.white
                          ),
                        ),
                        content: const Text(
                          "Observez vous grandir chaque jour",
                          style: TextStyle(
                            fontSize: AppConstants.padding_20,
                            color: Colors.white
                          ),
                        ),
                        state: StepState.indexed,
                        isActive: isSelected
                      )
                  ] 
                ),
                  SizedBox(
                    height: AppConstants.padding_50,
                    width: MediaQuery.of(context).size.width*0.85,
                    child: ElevatedButton(
                      style: const ButtonStyle(
                        
                      ),
                      onPressed: () { 
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context)=> const UserPreference()
                          ),
                        );
                      },
                      child: const Text("Débuter"),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}