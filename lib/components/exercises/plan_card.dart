import 'package:fitness_app/utils/constant.dart';
import 'package:flutter/material.dart';

import '../home/home.dart';

// ignore: must_be_immutable
class Plan extends StatelessWidget {
  String title;
  String image;
  Plan({super.key, 
    required this.title,
    required this.image
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10,right: 5),
      height: 180,
      width: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: primaryColor
        ),
        image: DecorationImage(
          fit: BoxFit.cover,
          scale: 1,
          opacity: 1,
          image: AssetImage(assetUrl+image)
        ),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context)=> const Home()
            ),
          );
        },
        child: Center(
          child: Text(
            title
          ),
        ),
      ),
    );
  }
}