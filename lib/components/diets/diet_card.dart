import 'package:fitness_app/components/diets/diet_details.dart';
import 'package:flutter/material.dart';

import '../../models/diet.dart';
import '../../utils/colors.dart';

// ignore: must_be_immutable
class Diet extends StatelessWidget {
  DietEntity data;
  Diet({super.key, 
    required this.data, 
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context)=> DietDetails(
              title: data.title!,
              description: data.description!,
              calory: data.calory!,
              category: data.plan_id!.description!,
              image: data.illustration!,
            )
          ),
        );
      },
      child: Container(
          height: MediaQuery.of(context).size.height*0.2,
          width: MediaQuery.of(context).size.width*0.4,
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: AppColors.primaryTextColor,
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
            image: AssetImage(data.illustration!)
          ),
          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                        data.plan_id!.description!.toString(),
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
                  padding: const EdgeInsets.only(right:58 ),
                  child: Text(
                    data.title!,
                    style: const TextStyle(
                      fontSize: 10,
                      color: AppColors.primaryColor
                    )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 90.0,top: 5),
                  child: Text(
                    '${data.calory} kCal',
                    style: const TextStyle(
                      fontSize: 10,
                      color: AppColors.primaryColor
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}