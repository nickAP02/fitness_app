import 'dart:convert';
import 'dart:developer';
import 'package:fitness_app/components/home/home.dart';
import 'package:fitness_app/service/local_storage.dart';
import 'package:fitness_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/app_theme.dart';
import '../../utils/colors.dart';
import '../home/search_page.dart';
import '../settings.dart';

class BottomNavBar extends StatelessWidget {

  BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Color newColor=const Color.fromARGB(255, 255, 255, 255);
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: (value) => {
        newColor =AppColors.primaryColor
      },
      // selectedItemColor:newColor,
      backgroundColor: AppTheme.theme.scaffoldBackgroundColor,
      items: [
        BottomNavigationBarItem(
          label: "Accueil",
          icon: IconButton(
            onPressed: ()=>{
              log("boutton accueil"),
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context)=> const Home()
                ),
              )
            }, 
            icon: const Icon(Icons.home_outlined,color: AppColors.secondaryColor,)
          )
        ),
        BottomNavigationBarItem(
          label: "Recherche",
          icon: IconButton(
            onPressed: ()=>{
              log("boutton recherche"),
              // Navigator.of(context).pushNamed(AppRoutes.SEARCH)
              Navigator.push(context, 
                MaterialPageRoute(
                  builder: ((context) =>Search() ),
                )
              )
            }, 
            icon: const Icon(Icons.search_rounded,color: AppColors.secondaryColor,)
          )
        ),
        BottomNavigationBarItem(
          label: "Profile",
          icon: IconButton(
            onPressed: ()=>{
              log("boutton profile"),
              Navigator.of(context).pushNamed(
                AppRoutes.PROFILE
                // MaterialPageRoute(
                //   builder: (context)=> const Profile()
                // ),
                // (route) => false,
              )
            }, 
            icon: const Icon(Icons.account_circle,color: AppColors.secondaryColor,)
          )
        ),
        BottomNavigationBarItem(
          label: "Paramètres",
          icon: IconButton(
            onPressed: ()=>{
              log("boutton settings"),
              Navigator.of(context).pushNamed(
                AppRoutes.PARAMS
              )
            }, 
            icon: const Icon(Icons.settings,color: AppColors.secondaryColor,)
          )
        )
      ]
    );
  }
}