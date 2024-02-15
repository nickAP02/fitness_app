
import 'package:fitness_app/features/home/home.dart';
import 'package:fitness_app/utils/colors.dart';
import 'package:fitness_app/utils/images.dart';
import 'package:flutter/material.dart';


class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  String userAvatar="";
  // void logout() async{
  //   log("google sign out");
  //   // googleAuth.signOutWithGoogle();
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   userAvatar = prefs.getString("avatar")??"";
  //   // prefs.clear();
  //   Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.LOGIN, (route) => false);
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.5),
                      BlendMode.darken,
                    ),
                    image:const AssetImage(AppImages.exerciceSample1)
                )
              ),
              child:Row(
                children: [
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: Image.asset(AppImages.exerciceSample1,
                        fit: BoxFit.cover),
                  ),
                  const Text("Espace membre"),
                ],
              ) ,
            ),
          Column(
            children: [
              ListTile(
                onTap: (){
                  Navigator.pushAndRemoveUntil(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => const Home(),
                    ),
                    (route) => false
                  );
                },
                leading: const Icon(Icons.home,color: AppColors.secondaryColor,),
                title: const Text("Accueil"),
              ),
              ListTile(
                onTap: (){},
                leading: const Icon(Icons.sports,color: AppColors.secondaryColor,),
                title: const Text("Pourquoi MyFitness App"),
              ),
              ListTile(
                onTap: (){},
                leading: const Icon(Icons.policy,color: AppColors.secondaryColor,),
                title: const Text("Règles d'utilisation"),
              ),
              ListTile(
                onTap: (){},
                leading: const Icon(Icons.content_paste,color: AppColors.secondaryColor,),
                title: const Text("Politique de confidentialité"),
              ),
              ListTile(
                onTap: (){},
                leading: const Icon(Icons.info,color: AppColors.secondaryColor,),
                title: const Text("A propos"),
              ),
              ListTile(
                onTap: (){
                  // logout();
                },
                leading: const Icon(Icons.logout,color: AppColors.secondaryColor,),
                  title: const Text(
                    "Déconnexion",
                    // style: TextStyle(
                    //   color: AppColors.primaryColor
                    // )
                  ),
              ),
            ],
          ),
        ],
        ),
      ),
    );
  }
}