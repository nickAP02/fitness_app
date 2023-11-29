import 'package:flutter/material.dart';

import '../../utils/colors.dart';

// ignore: must_be_immutable
class Plan extends StatelessWidget {
  String title;
  String image;
  Function() callback;
  Plan({super.key, 
    required this.title,
    required this.image,
    required this.callback
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
      child: GestureDetector(
        onTap: callback,
        child: Center(
          child: Text(
            title
          ),
        ),
      ),
    );
  }
}