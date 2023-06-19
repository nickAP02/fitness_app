import 'dart:developer';

import 'package:fitness_app/components/home/home.dart';
import 'package:fitness_app/components/home/search_page.dart';
import 'package:fitness_app/utils/constant.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: secondaryColor,
      backgroundColor: Colors.white,
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
            icon: const Icon(Icons.home_outlined,color: primaryColor,)
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
            icon: const Icon(Icons.search_rounded,color: primaryColor,)
          )
        ),
        BottomNavigationBarItem(
          label: "Profile",
          icon: IconButton(
            onPressed: ()=>{
              log("boutton profile"),

            }, 
            icon: const Icon(Icons.account_circle,color: primaryColor,)
          )
        )
      ]
    );
  }
}