import 'package:fitness_app/components/home/home.dart';
import 'package:fitness_app/components/partners/home/home_partner.dart';
import 'package:fitness_app/components/partners/home/settings.dart';
import 'package:fitness_app/components/partners/subscription/subscription.dart';
import 'package:fitness_app/components/workouts/workouts.dart';
import 'package:flutter/material.dart';

import '../../utils/app_theme.dart';
import '../../utils/colors.dart';
import '../home/profile.dart';
import '../settings.dart';

class BottomNavBar extends StatelessWidget {
  bool isUser = true;
  int currentIndex = 0;
  BottomNavBar({
    super.key,
    required this.isUser
  });

  @override
  Widget build(BuildContext context) {
    Color newColor=const Color.fromARGB(255, 255, 255, 255);
    List<Widget> userNavItems = [
        buildNavBarItem(
          "Accueil",
          (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context)=>Home()
              )
            );
          },
          Icon(Icons.home_outlined,color: AppColors.secondaryColor,)
        ),
        buildNavBarItem(
          "Entraînement",
          (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context)=>Workouts()
              )
            );
          },
          Icon(Icons.fitness_center_outlined,color: AppColors.secondaryColor,)
        ),
        buildNavBarItem(
          "Paramètres",
          (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context)=>Settings()
              )
            );
          },
          Icon(Icons.settings_outlined,color: AppColors.secondaryColor,)
        ),
      ];
    List<Widget> partnersNavItems = [
        buildNavBarItem(
          "Accueil",
          (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context)=>HomePartner()
              )
            );
          },
          Icon(Icons.home_outlined,color: AppColors.secondaryColor,)
        ),
        buildNavBarItem(
          "Abonnement",
          (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context)=>Subscription()
              )
            );
          },
          Icon(Icons.payment_outlined,color: AppColors.secondaryColor,)
        ),
        buildNavBarItem(
          "Paramètres",
          (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context)=>SettingsPartner()
              )
            );
          },
          Icon(Icons.settings_outlined,color: AppColors.secondaryColor,)
        ),
      ];
    return NavigationBar(
      // type: BottomNavigationBarType.fixed,
      // onTap: (value) => {
      //   newColor =AppColors.primaryColor
      // },
      // selectedItemColor:newColor,
      selectedIndex: currentIndex,
      onDestinationSelected: (int index){
        print("selected $index");
        currentIndex = index;
        print("current $currentIndex");
      },
      backgroundColor: AppTheme.theme.scaffoldBackgroundColor,
      destinations: isUser ? userNavItems.toList() : partnersNavItems.toList()
      // items: isUser ? userNavItems.toList() : partnersNavItems.toList()
    );
  }

  Widget buildNavBarItem(String title,Function() onPressed,Icon icon) {
    return NavigationDestination(
        label: title,
        icon: IconButton(
          focusColor: AppColors.primaryColor.withOpacity(0.3),
          onPressed: onPressed, 
          icon: icon
        )
      );
  }
}