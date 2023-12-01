import 'dart:developer';

import 'package:fitness_app/components/auth/partner_signup.dart';
import 'package:fitness_app/components/onboarding/lang_preference.dart';
import 'package:fitness_app/service/google_auth.dart';
import 'package:fitness_app/components/auth/login_page.dart';
// import 'package:fitness_app/components/home/home.dart';
// import 'package:fitness_app/components/home/profile.dart';
import 'package:fitness_app/service/local_storage.dart';
import 'package:fitness_app/utils/images.dart';
import 'package:flutter/material.dart';

import '../../utils/routes.dart';
import '../reusable/custom_button.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  LocalStorage userStorage = LocalStorage();
  // String username = "";
  // String avatar = "";
  // String email = "";
  // String telephone = "";
  GoogleAuth googleAuth = GoogleAuth();
  var user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: secondaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Opacity(
              opacity:0.5,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                        colorFilter: ColorFilter.mode(
                          Color.fromRGBO(0, 0, 0, 0.606),
                          BlendMode.darken
                        ),
                        image: AssetImage(
                          AppImages.exerciceSample2
                        )
                    ),
                    boxShadow: [
                      BoxShadow(
                        color:Colors.black26.withOpacity(0.7),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3)
                      )
                    ]
                  ),
                child: 
                Center(
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top:120.0,left: 10),
                        child: Text(
                          "Inscription",
                          style: TextStyle(
                            fontSize: 28,
                            color: Colors.white
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top:78.0,left: 10),
                        child: Text(
                          "MyFitness",
                          style: TextStyle(
                            fontSize: 45,
                            color: Colors.white
                          ),
                        ),
                      ),
                      Center(
                        child:Column(
                          children: [
                          Text("S'inscrire en tant que"),
                          Padding(
                            padding: const EdgeInsets.only(left:8.0,right: 10,),
                            child: CustomButton(
                              title:"Professionnel",
                              onPressed: (){
                                Navigator.push(
                                  context, 
                                  MaterialPageRoute(
                                    builder: (context)=>PartnerSignUp()
                                  )
                                );
                              }
                              ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top:10,bottom: 8,right: 30,left: 30),
                            child: Text("ou"),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:8.0,right: 10),
                            child: CustomButton(
                              title:"Utilisateur", 
                              onPressed: (){
                                Navigator.push(
                                  context, 
                                  MaterialPageRoute(
                                    builder: (context)=>LangPreference()
                                  )
                                );
                              }
                            )
                          ),
                        ],
                        ) 
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}