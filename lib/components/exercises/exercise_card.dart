import 'package:fitness_app/utils/constant.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';

// ignore: must_be_immutable
class Exercice extends StatelessWidget {
  String description;
  dynamic time;
  String category;
  String image;
  Exercice({super.key, 
    required this.description,
    required this.time,
    required this.category,
    required this.image
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 120,
        width: 80,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: AppColors.primaryColor
          ),
          image: DecorationImage(
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.5),
            BlendMode.darken,
          ),
          fit: BoxFit.cover,
          scale: 1,
          opacity: 1,
          image: AssetImage(image)
        ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom:65.0,left: 80),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.primaryColor,
                  ),
                  height: 20,
                  width: 60,
                  child: Center(
                    child: Text(
                      category,
                      style: const TextStyle(
                        // backgroundColor: primaryColor,
                        fontSize: 6,
                        color: Colors.white
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right:58.0),
                child: Text(
                  description,
                  style: const TextStyle(
                    fontSize: 10,
                    color: AppColors.primaryColor
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 90.0,top: 5),
                child: Text(
                  '$time min',
                  style: const TextStyle(
                    fontSize: 10,
                    color: AppColors.primaryColor
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }
}