import 'package:flutter/material.dart';

import '../../components/reusable/bottom_navbar.dart';

class Workouts extends StatelessWidget {
  const Workouts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Placeholder(),
          BackButton(
            onPressed: (){
              Navigator.pop(context);
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(isUser:true),
    );
  }
}