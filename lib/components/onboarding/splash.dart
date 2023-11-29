import 'package:flutter/material.dart';

import '../../utils/routes.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stepper(
            type:StepperType.horizontal,
            steps: [
              Step(
                title: const Text("Etape 1"),
                state: StepState.indexed,
                content: GestureDetector(
                  onTap: (){
                    Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.LOGIN, (route) => false);
                  },
                  child: const Center(
                    child: Text("hello wordl"),
                  ),
                ),
              ),
              Step(
                title: const Text("Etape 2"),
                state: StepState.indexed,
                content: GestureDetector(
                  onTap: (){
                    Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.LOGIN, (route) => false);
                  },
                  child: const Center(
                    child: Text("hello wordl"),
                  ),
                ),
              ),
              Step(
                title: const Text("Etape 3"),
                state: StepState.indexed,
                content: GestureDetector(
                  onTap: (){
                    Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.LOGIN, (route) => false);
                  },
                  child: const Center(
                    child: Text("hello wordl"),
                  ),
                ),
              ),
              Step(
                title: const Text("Etape 4"),
                state: StepState.indexed,
                content: GestureDetector(
                  onTap: (){
                    Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.LOGIN, (route) => false);
                  },
                  child: const Center(
                    child: Text("hello wordl"),
                  ),
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}