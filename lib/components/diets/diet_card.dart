import 'package:flutter/material.dart';

import '../../utils/colors.dart';

// ignore: must_be_immutable
class Diet extends StatelessWidget {
  String description;
  double calory;
  String category;
  String image;
  Diet({super.key, 
    required this.description,
    required this.calory,
    required this.category,
    required this.image
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 120,
        width: 110,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: AppColors.primaryColor
          ),
          image: DecorationImage(
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
                padding: const EdgeInsets.only(bottom:65.0,right: 90),
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
                        backgroundColor: AppColors.primaryColor,
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
                  )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 62.0,top: 5),
                child: Text(
                  '$calory kCal',
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