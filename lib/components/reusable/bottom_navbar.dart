import 'dart:developer';
import 'package:fitness_app/components/home/home.dart';
import 'package:fitness_app/components/home/profile.dart';
import 'package:fitness_app/components/home/search_page.dart';
import 'package:fitness_app/service/local_storage.dart';
import 'package:flutter/material.dart';

import '../../utils/app_theme.dart';
import '../../utils/colors.dart';
import '../settings.dart';

class BottomNavBar extends StatelessWidget {
  final LocalStorage userStorage = LocalStorage();
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
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context)=> const Search()
                ),
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
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context)=> const Profile()
                ),
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
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context)=>const Settings())
              )
            }, 
            icon: const Icon(Icons.settings,color: AppColors.secondaryColor,)
          )
        )
      ]
    );
  }
}