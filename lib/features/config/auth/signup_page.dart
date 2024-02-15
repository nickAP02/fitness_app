
import 'package:fitness_app/components/onboarding/preferences.dart';
import 'package:fitness_app/features/config/auth/partner_signup.dart';
import 'package:fitness_app/service/google_auth.dart';
import 'package:fitness_app/utils/constant.dart';
// import 'package:fitness_app/components/home/home.dart';
// import 'package:fitness_app/components/home/profile.dart';
import 'package:fitness_app/utils/images.dart';
import 'package:flutter/material.dart';

import '../../../components/reusable/custom_button.dart';



class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GoogleAuth googleAuth = GoogleAuth();
  // ignore: prefer_typing_uninitialized_variables
  var user;
  FocusNode? focus;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: secondaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Opacity(
              opacity:0.5,
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                // decoration: BoxDecoration(
                //     image: const DecorationImage(
                //         colorFilter: ColorFilter.mode(
                //           Color.fromRGBO(0, 0, 0, 0.606),
                //           BlendMode.darken
                //         ),
                //         image: AssetImage(
                //           AppImages.exerciceSample2
                //         )
                //     ),
                //     boxShadow: [
                //       BoxShadow(
                //         color:Colors.black26.withOpacity(0.7),
                //         spreadRadius: 5,
                //         blurRadius: 7,
                //         offset: const Offset(0, 3)
                //       )
                //     ]
                //   ),
                child: 
                Center(
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top:120.0,left: 10),
                        child: Text(
                          "Inscription",
                          style: TextStyle(
                            fontSize: AppConstants.fontSize_30,
                            color: Colors.white
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:58.0,left: 10,bottom: 50),
                        child: Image.asset(AppImages.logo,height: 80,width: 80,),
                      ),
                      // const Padding(
                      //   padding: EdgeInsets.only(top:78.0,left: 10),
                      //   child: Text(
                      //     "MyFitness",
                      //     style: TextStyle(
                      //       fontSize: AppConstants.fontSize_45,
                      //       color: Colors.white
                      //     ),
                      //   ),
                      // ),
                      Center(
                        child:Column(
                          children: [
                          const Text("S'inscrire en tant que"),
                          Padding(
                            padding: const EdgeInsets.only(left:8.0,right: 10,),
                            child: CustomButton(
                              size: MediaQuery.of(context).size.width,
                              title:"Professionnel",
                              onPressed: (){
                                Navigator.push(
                                  context, 
                                  MaterialPageRoute(
                                    builder: (context)=>const PartnerSignUp()
                                  )
                                );
                              }, focus: focus!,
                              ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top:10,bottom: 8,right: 30,left: 30),
                            child: Text("ou"),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:8.0,right: 10),
                            child: CustomButton(
                              size: MediaQuery.of(context).size.width,
                              title:"Utilisateur", 
                              onPressed: (){
                                Navigator.push(
                                  context, 
                                  MaterialPageRoute(
                                    builder: (context)=>const UserPreference()
                                  )
                                );
                              }, focus: focus!,
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