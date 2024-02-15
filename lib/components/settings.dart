import 'package:fitness_app/components/profile.dart';
import 'package:fitness_app/components/reusable/bottom_navbar.dart';
import 'package:fitness_app/components/reusable/custom_appbar.dart';
import 'package:fitness_app/components/user_params.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Paramètres", context),
      body: ListView(
        children: [
          ListTile(
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context)=> const Profile()
                ),
              );
            },
            leading: const Icon(Icons.manage_accounts),
            title: const Text("Mon compte"),
          ),
          ListTile(
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context)=> const UserParams()
                ),
              );
            },
            leading: const Icon(Icons.manage_accounts),
            title: const Text("Informations personnelles"),
          ),
          // ListTile(
          //   onTap: ()=>{
          //     // Navigator.of(context).push(
          //     //   MaterialPageRoute(
          //     //     builder: (context)=> const MembershipCard()
          //     //   ),
          //     // ),
          //   },
          //   leading: const Icon(
          //     Icons.card_membership,
          //     color: AppColors.secondaryColor,
          //   ),
          //   title: const Text("Carte de membre MyFit"),
          // ),
          const ListTile(
            leading: Icon(Icons.track_changes_rounded),
            title: Text("Objectifs"),
          ),
          // const Divider(color: AppColors.secondaryColor,thickness: 1.5,),
          // const ListTile(
          //   leading: Icon(
          //     Icons.location_on,
          //     color: AppColors.secondaryColor,
          //   ),
          //   title: Text("Centres sportifs visités"),
          // ),
          const Divider(color: AppColors.secondaryColor,thickness: 1.5,),
          const ListTile(
            leading: Icon(Icons.bar_chart),
            title: Text("Statistiques"),
          ),
          const ListTile(
            leading: Icon(Icons.menu_book),
            title: Text("Termes et conditions d'utilisation"),
          ),
          const Divider(color: AppColors.secondaryColor,thickness: 1.5,),
          const ListTile(
            leading: Icon(Icons.info),
            title: Text("A propos"),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(isUser: true),
    );
  }
}