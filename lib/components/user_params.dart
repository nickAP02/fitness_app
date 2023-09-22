import 'package:fitness_app/components/reusable/custom_appbar.dart';
import 'package:fitness_app/utils/colors.dart';
import 'package:flutter/material.dart';

class UserParams extends StatefulWidget {
  const UserParams({super.key});

  @override
  State<UserParams> createState() => _UserParamsState();
}

class _UserParamsState extends State<UserParams> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Informations personnelles", context),
      body: const Column(
        children: [
         Column(
          
          children: [
            ListTile(
              leading: Icon(Icons.data_array_rounded,color: AppColors.secondaryColor),
              title:Text("Taille : ",
              style: TextStyle(
                color: AppColors.primaryColor
              ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right:180.0),
              child: Text("1m80"),
            ),
            ListTile(
              leading: Icon(Icons.data_array_rounded,color: AppColors.secondaryColor),
              title:Text("Poids : ",
              style: TextStyle(
                color: AppColors.primaryColor
              ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right:180.0),
              child: Text("80 kg"),
            ),
            ListTile(
            leading: Icon(Icons.bolt,color: AppColors.secondaryColor,),
            title: Text(
                "Objectif actuel",
                style: TextStyle(
                  color: AppColors.primaryColor
                )
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right:150.0),
              child: Text("Perte de pois"),
            )
          ],
        ),
        ],
      )
      );
  }
}