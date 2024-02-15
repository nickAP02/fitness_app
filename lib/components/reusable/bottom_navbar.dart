import 'package:fitness_app/features/home/home.dart';
import 'package:fitness_app/features/home/home_partner.dart';
import 'package:fitness_app/features/home/settings.dart';
import 'package:fitness_app/features/subscription/presentation/subscription.dart';
import 'package:fitness_app/features/workout/workouts.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../utils/app_theme.dart';
import '../../utils/colors.dart';
import '../settings.dart';

// ignore: must_be_immutable
class BottomNavBar extends StatelessWidget {
  bool isUser = true;
  int currentIndex = 0;
  BottomNavBar({
    super.key,
    required this.isUser
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> userNavItems = [
        buildNavBarItem(
          "Accueil",
          (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context)=>const Home()
              )
            );
          },
          const Icon(Icons.home_outlined,color: AppColors.secondaryColor,)
        ),
        buildNavBarItem(
          "Entraînement",
          (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context)=>const Workouts()
              )
            );
          },
          const Icon(Icons.fitness_center_outlined,color: AppColors.secondaryColor,)
        ),
        buildNavBarItem(
          "Paramètres",
          (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context)=>const Settings()
              )
            );
          },
          const Icon(Icons.settings_outlined,color: AppColors.secondaryColor,)
        ),
      ];
    List<Widget> partnersNavItems = [
        buildNavBarItem(
          "Accueil",
          (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context)=>const HomePartner()
              )
            );
          },
          const Icon(Icons.home_outlined,color: AppColors.secondaryColor,)
        ),
        buildNavBarItem(
          "Agenda",
          (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context)=>const Subscription()
              )
            );
          },
          const Icon(Icons.payment_outlined,color: AppColors.secondaryColor,)
        ),
        buildNavBarItem(
          "Abonnement",
          (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context)=>const Subscription()
              )
            );
          },
          const Icon(Icons.payment_outlined,color: AppColors.secondaryColor,)
        ),
        buildNavBarItem(
          "Paramètres",
          (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context)=>const SettingsPartner()
              )
            );
          },
          const Icon(Icons.settings_outlined,color: AppColors.secondaryColor,)
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
        if (kDebugMode) {
          print("selected $index");
        }
        currentIndex = index;
        if (kDebugMode) {
          print("current $currentIndex");
        }
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