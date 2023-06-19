import 'dart:developer';

import 'package:fitness_app/components/auth/google_auth.dart';
import 'package:fitness_app/components/auth/login_page.dart';
import 'package:fitness_app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Profile extends StatelessWidget {
  final GoogleAuth googleAuth = GoogleAuth();
  final GoogleSignInAccount? user;
  Profile({
    super.key,
    required this.user
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   title: const Text("Profile"),
      // ),
      body:  Center(
        child:Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(user!.photoUrl.toString()),
            ),
            Column(
              children: [
                ListTile(
                   leading: const Icon(Icons.email,color: Colors.white,),
                    title: Text(
                      user!.displayName.toString(),
                      style: const TextStyle(
                        color: primaryColor
                      )
                    ),
                ),
                ListTile(
                    title: Text(
                      user!.email,
                      style: const TextStyle(
                        color: primaryColor
                      )
                    ),
                ),
              ],
            ),
            const ListTile(
              leading: Icon(Icons.fireplace,color: Colors.white,),
                title: Text(
                  "Mon plan actuel",
                  style: TextStyle(
                    color: primaryColor
                  )
                ),
            ),
            const ListTile(
                title: Text(
                  "",
                  style: TextStyle(
                    color: primaryColor
                  )
                ),
            ),
            const ListTile(
                title: Text(
                  "",
                  style: TextStyle(
                    color: primaryColor
                  )
                ),
            ),
            ListTile(
              onTap: (){
                log("google sign out");
                googleAuth.signOutWithGoogle();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context)=> const Login()
                  )
                );
              },
              leading: const Icon(Icons.logout,color: primaryColor,),
                title: const Text(
                  "Déconnexion",
                  style: TextStyle(
                    color: primaryColor
                  )
                ),
            ),
          ],
        ),
      ),
    );
  }
}