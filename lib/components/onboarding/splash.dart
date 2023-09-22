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
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stepper(
          type:StepperType.horizontal,
          steps: [
            Step(
              title: Text("Etape 1"),
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
              title: Text("Etape 2"),
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
              title: Text("Etape 3"),
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
              title: Text("Etape 4"),
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
    );
  }
}